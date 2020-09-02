import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonam_web_app/model/brewery.dart';
import 'package:sonam_web_app/repository/data_repository.dart';
import 'package:sonam_web_app/resources/strings.dart';
import 'package:sonam_web_app/widgets/brewery_list_item.dart';

class BreweryListPage extends StatefulWidget {
  @override
  _BreweryListPageState createState() => _BreweryListPageState();
}

class _BreweryListPageState extends State<BreweryListPage> {
  final DataRepository dataRepository = DataRepository();

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
      body: StreamBuilder<List<Brewery>>(
        stream: dataRepository.controller.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Brewery>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              {
                return _placeHolderView();
              }
            case ConnectionState.active:
              {
                if (snapshot.hasError || !snapshot.hasData) {
                  return _noDataView();
                }
                List<Brewery> breweries = snapshot.data;
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Brewery item = breweries[index];
                    return BreweryListItem(brewery: item);
                  },
                  itemCount: breweries == null ? 0 : breweries.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2),
                );
              }
            default:
              {
                return _noDataView();
              }
          }
        },
      ),
    );
  }

  Widget _placeHolderView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        Strings.Getting_your_data,
        style:
            TextStyle(fontSize: Theme.of(context).textTheme.headline4.fontSize),
      ),
    );
  }

  Widget _noDataView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        Strings.NO_DATA_FOUND,
        style:
            TextStyle(fontSize: Theme.of(context).textTheme.headline4.fontSize),
      ),
    );
  }
}
