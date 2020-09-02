import 'dart:async';

import 'package:sonam_web_app/database/database_manager.dart';
import 'package:sonam_web_app/model/brewery.dart';
import 'package:sonam_web_app/network/http_service.dart';

class DataRepository {
  final databaseManager = DataBaseManager.databaseManager;
  final httpService = HttpService.httpService;

  StreamController controller = StreamController<List<Brewery>>();

  void getBreweries() async {
    List<Brewery> breweries;

    //checking whether database has breweries present
    if (databaseManager.hasBreweries()) {
      //getting data from database
      breweries = databaseManager.getBreweries();
      controller.add(breweries);

      //getting latest data from REST Api and storing in db
      breweries = await httpService.getBreweries();
      databaseManager.saveBreweries(breweries);
    } else {
      //getting data from REST Api for the first time
      breweries = await httpService.getBreweries();
      databaseManager.saveBreweries(breweries);
    }

    //adding the latest data in controller to update the stream and refresh UI
    controller.add(breweries);
  }

  void dispose() {
    controller.close();
  }
}
