import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sonam_web_app/model/brewery.dart';

class HiveDatabaseManager {
  static final HiveDatabaseManager _singleton = HiveDatabaseManager._internal();

  factory HiveDatabaseManager() => _singleton;

  HiveDatabaseManager._internal();

  static HiveDatabaseManager get databaseManager => _singleton;

  static const BREWERIES = 'breweries';
  
  void initializeHive() async{
    Hive.registerAdapter(BreweryAdapter());
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  void saveBreweries(List<Brewery> breweries) async {
    var _breweryBox = await Hive.openBox(BREWERIES);
    _breweryBox.put(BREWERIES,breweries);
  }

  Future<List<Brewery>> getBreweries() async {
    var _breweryBox = await Hive.openBox(BREWERIES);
    /*_breweryBox.values.forEach((element) {
      breweries.add(element);
    });*/
    return _breweryBox.get(BREWERIES);
  }

  Future<bool> hasBreweries() async {
    var _breweryBox = await Hive.openBox(BREWERIES);
    return _breweryBox.isNotEmpty;
  }

  void deleteBreweries() async {
   var  _breweryBox = await Hive.openBox(BREWERIES);
    _breweryBox.deleteFromDisk();
  }
}
