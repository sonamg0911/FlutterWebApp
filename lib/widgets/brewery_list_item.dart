import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sonam_web_app/model/brewery.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sonam_web_app/resources/strings.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'brewery_detail_page.dart';

class BreweryListItem extends StatelessWidget {
  final Brewery brewery;

  BreweryListItem({@required this.brewery});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BreweryDetail(brewery: brewery),
        ),
      ),
      child: Card(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 15,
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getBreweryNameView(),
                  _getBreweryWebsiteNameView(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [_getBreweryTypeView(), _getBreweryContactView()],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBreweryNameView() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '${brewery.name.toUpperCase()}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 25,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _getBreweryWebsiteNameView() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        child: Text(
          '${brewery.websiteUrl}',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              color: Colors.black,
              decoration: TextDecoration.underline),
        ),
        onTap: () {
          if (kIsWeb) html.window.open(brewery.websiteUrl, '_blank');
        },
      ),
    );
  }

  Widget _getBreweryTypeView() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '${brewery.breweryType.toUpperCase()}',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _getBreweryContactView() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.phone,
            color: Colors.lightBlue,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              '${brewery.phone.isNotEmpty ? brewery.phone : Strings.NO_CONTACT}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
