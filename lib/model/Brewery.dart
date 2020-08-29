import 'package:flutter/foundation.dart';

class Brewery {
  final int id;
  final String name;
  final String brewery_type;
  final String street;
  final String city;
  final String state;
  final String postal_code;
  final String longitude;
  final String latitude;
  final String phone;
  final String website_url;
  final String updated_at;

  Brewery({
    @required this.id,
    @required this.name,
    @required this.brewery_type,
    @required this.street,
    @required this.city,
    @required this.state,
    @required this.postal_code,
    @required this.longitude,
    @required this.latitude,
    @required this.phone,
    @required this.website_url,
    @required this.updated_at,
  });

  factory Brewery.fromJson(Map<String, dynamic> json) {
    return Brewery(
      id: json['id'] as int,
      name: json['name'] as String,
      brewery_type: json['brewery_type'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postal_code: json['postal_code'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      phone: json['phone'] as String,
      website_url: json['website_url'] as String,
      updated_at: json['updated_at'] as String,
    );
  }
}
