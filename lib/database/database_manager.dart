import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:sonam_web_app/model/brewery.dart';

class DataBaseManager {
  //Singleton (to have only one instance of this class in whole app)
  static final DataBaseManager _singleton = DataBaseManager._internal();
  factory DataBaseManager() => _singleton;
  DataBaseManager._internal();
  static DataBaseManager get databaseManager => _singleton;

  static const BREWERIES_LIST_SIZE = 'breweries_list_size';

  void saveBreweries(List<Brewery> breweries) {
    //Storing the breweries list size
    getLocalStorage()[BREWERIES_LIST_SIZE] = breweries.length.toString();

    for (var i = 0; i < breweries.length; i++) {
      //Storing the brewery in list in json string format
      getLocalStorage()['$i'] = jsonEncode(breweries.elementAt(i));
    }
  }

  List<Brewery> getBreweries() {
    //getting the list size from the database
    final listSize = getLocalStorage()[BREWERIES_LIST_SIZE];

    List<Brewery> breweries = List();
    for (var i = 0; i < int.parse(listSize); i++) {
      //getting the json string from database and converting to Brewery object
      breweries.add(Brewery.fromJson(json.decode(getLocalStorage()['$i'])));
    }
    return breweries;
  }

  bool hasBreweries() {
    //checking the brewery list size key from database
    return getLocalStorage()[BREWERIES_LIST_SIZE] != null;
  }

  void deleteBreweries() {
    //deleting database
    getLocalStorage().clear();
  }

  Storage getLocalStorage() {
    return window.localStorage;
  }
}
