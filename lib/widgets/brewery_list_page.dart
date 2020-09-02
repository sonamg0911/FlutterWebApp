import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sonam_web_app/data_repository.dart';
import 'package:sonam_web_app/model/brewery.dart';
import 'package:sonam_web_app/widgets/brewery_list_item.dart';

class BreweryListPage extends StatefulWidget {
  @override
  _BreweryListPageState createState() => _BreweryListPageState();
}

class _BreweryListPageState extends State<BreweryListPage> {
  final DataRepository dataRepository = DataRepository();
  Stream<List<Brewery>> breweryList;

  @override
  void initState() {
    super.initState();
    //getting the breweries from data repository
    dataRepository.getBreweries();
  }

  @override
  void dispose() {
    //disposing the controller when state is no more present
    dataRepository.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breweries"),
      ),
      body: StreamBuilder(
        stream: dataRepository.controller.stream as Stream<List<Brewery>>,
        builder: (BuildContext context, AsyncSnapshot<List<Brewery>> snapshot) {
          if (snapshot.hasData) {
            List<Brewery> breweries = snapshot.data;
            return ListView(
              children: breweries
                  .map(
                    (Brewery brewery) => BreweryListItem(brewery: brewery),
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
