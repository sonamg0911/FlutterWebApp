

import 'package:flutter/material.dart';
import 'package:sonam_web_app/data_repository.dart';
import 'package:sonam_web_app/model/brewery.dart';
import 'package:sonam_web_app/widgets/brewery_list_item.dart';

class BreweryListPage extends StatelessWidget {
  final DataRepository dataRepository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breweries"),
      ),
      body: FutureBuilder(
        future: dataRepository.getBreweries(),
        builder: (BuildContext context, AsyncSnapshot<List<Brewery>> snapshot) {
          if (snapshot.hasData) {
            List<Brewery> breweries = snapshot.data;
            return ListView(
              children: breweries
                  .map(
                    (Brewery brewery) => BreweryListItem(brewery: brewery),
              ).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
