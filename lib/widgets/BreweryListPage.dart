

import 'package:flutter/material.dart';
import 'package:sonam_web_app/network/HttpService.dart';
import 'package:sonam_web_app/model/Brewery.dart';

class BreweryListPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breweries"),
      ),
      body: FutureBuilder(
        future: httpService.getBreweries(),
        builder: (BuildContext context, AsyncSnapshot<List<Brewery>> snapshot) {
          if (snapshot.hasData) {
            List<Brewery> breweries = snapshot.data;
            return ListView(
              children: breweries
                  .map(
                    (Brewery brewery) => ListTile(
                  title: Text(brewery.name),
                  subtitle: Text("${brewery.brewery_type}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                     /* builder: (context) => PostDetail(
                        post: post,
                      ),*/
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
