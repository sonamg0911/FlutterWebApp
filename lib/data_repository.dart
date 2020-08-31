import 'package:sonam_web_app/database/database_manager.dart';
import 'package:sonam_web_app/model/brewery.dart';
import 'package:sonam_web_app/network/http_service.dart';
import 'dart:developer';

class DataRepository {
  final databaseManager = DatabaseManager.databaseManager;
  final httpService = HttpService.httpService;

  Future<List<Brewery>> getBreweries() async {
    List<Brewery> breweries;
    bool hasBreweries = await databaseManager.hasBreweries();
    if (hasBreweries) {
      log("database");
      breweries = await databaseManager.getBreweries();
    } else {
      log("http");
      breweries = await httpService.getBreweries();
      databaseManager.saveBreweries(breweries);
    }
    return breweries;
  }
}
