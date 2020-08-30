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

  Box _breweryBox;

  void initializeHive() async{
    Hive.registerAdapter(BreweryAdapter());
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  void saveBreweries(List<Brewery> breweries) async {
    _breweryBox = await Hive.openBox(BREWERIES);
    _breweryBox.addAll(breweries);
  }

  Future<List<Brewery>> getBreweries() async {
    _breweryBox = await Hive.openBox(BREWERIES);
    List<Brewery> breweries;
    
    _breweryBox.values.forEach((element) { 
      breweries.add(element);
    });
    return breweries;
  }

  Future<bool> hasBreweries() async {
    _breweryBox = await Hive.openBox(BREWERIES);
    return _breweryBox.isNotEmpty;
  }

  void deleteBreweries() async {
    _breweryBox = await Hive.openBox(BREWERIES);
    _breweryBox.deleteFromDisk();
  }
}
