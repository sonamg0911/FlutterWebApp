import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sonam_web_app/model/brewery.dart';

import 'dart:html' as html;

class BreweryDetail extends StatelessWidget {

  final Brewery brewery;

  BreweryDetail({@required this.brewery});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                '${brewery.name.toUpperCase()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 40,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 20
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brewery Type : ${brewery.breweryType.toUpperCase()}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    'Street : ${brewery.street}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    'City : ${brewery.city}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    'State : ${brewery.state}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    'Postal Code : ${brewery.postalCode}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    'Contact : ${brewery.phone}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Website Link : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 30,
                            color: Colors.blueAccent,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          '${brewery.websiteUrl}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 30,
                              color: Colors.black,
                              decoration: TextDecoration.underline
                          ),
                        ),
                        onTap: (){ if(kIsWeb)
                          html.window.open(brewery.websiteUrl, '_blank');
                        },
                      ),
                    ],
                  ),
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
