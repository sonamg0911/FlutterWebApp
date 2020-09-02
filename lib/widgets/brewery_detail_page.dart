import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sonam_web_app/model/brewery.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:sonam_web_app/resources/strings.dart';

class BreweryDetail extends StatelessWidget {
  final Brewery brewery;

  BreweryDetail({@required this.brewery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            _getBreweryTitleView(),
            _getDetailCardView(context),
          ],
        ),
      ),
    );
  }

  Widget _getBreweryTitleView() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        '${brewery.name.toUpperCase()}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 40,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _getBreweryDetailItem(String name) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _getWebsiteLinkView() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          _getBreweryDetailItem(Strings.Website_Link),
          InkWell(
            child: Text(
              '${brewery.websiteUrl}',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 30,
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline),
            ),
            onTap: () {
              if (kIsWeb) html.window.open(brewery.websiteUrl, '_blank');
            },
          ),
        ],
      ),
    );
  }

  Widget _getDetailCardView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getBreweryDetailItem(
                  '${Strings.Brewery_Type}${brewery.breweryType.toUpperCase()}'),
              _getBreweryDetailItem('${Strings.Street}${brewery.street}'),
              _getBreweryDetailItem('${Strings.City}${brewery.city}'),
              _getBreweryDetailItem('${Strings.State}${brewery.state}'),
              _getBreweryDetailItem(
                  '${Strings.Postal_Code}${brewery.postalCode}'),
              _getBreweryDetailItem('${Strings.Contact}${brewery.phone}'),
              _getWebsiteLinkView(),
            ],
          ),
        ),
      ),
    );
  }
}
