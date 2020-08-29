import 'dart:convert';

import 'package:http/http.dart';
import 'package:sonam_web_app/model/Brewery.dart';

class HttpService {
  final String postsURL = "https://api.openbrewerydb.org/breweries";

  Future<List<Brewery>> getBreweries() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Brewery> posts = body
          .map(
            (dynamic item) => Brewery.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}