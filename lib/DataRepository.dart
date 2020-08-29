import 'package:sonam_web_app/database/DatabaseManager.dart';
import 'package:sonam_web_app/network/HttpService.dart';

import 'model/Brewery.dart';

class DataRepository {
  final databaseManager = DatabaseManager.databaseManager;
  final httpService = HttpService.httpService;

  Future<List<Brewery>> getBreweries() async {
    List<Brewery> breweries;
    if (databaseManager.database.collection("breweries").collectionId != null) {
      print("database");
      breweries = await databaseManager.getBreweries();
    } else {
      print("http");
      breweries = await httpService.getBreweries();
      databaseManager.saveBreweries(breweries);
    }

    return breweries;
  }
}
