import 'dart:convert';

import 'package:http/http.dart';
import 'package:sonam_web_app/database/DatabaseManager.dart';
import 'package:sonam_web_app/model/Brewery.dart';

class HttpService {

  static final HttpService _singleton = HttpService._internal();

  factory HttpService() => _singleton;

  HttpService._internal();

  static HttpService get httpService => _singleton;

  final String postsURL = "https://api.openbrewerydb.org/breweries";

  Future<List<Brewery>> getBreweries() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Brewery> breweries = body
          .map(
            (dynamic item) => Brewery.fromJson(item),
      )
          .toList();
      return breweries;
    } else {
      throw "Can't get breweries.";
    }
  }
}