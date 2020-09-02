import 'package:flutter/foundation.dart';

class Brewery{
  final int id;
  final String name;
  final String breweryType;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String longitude;
  final String latitude;
  final String phone;
  final String websiteUrl;
  final String updatedAt;

  Brewery({
    @required this.id,
    @required this.name,
    @required this.breweryType,
    @required this.street,
    @required this.city,
    @required this.state,
    @required this.postalCode,
    @required this.longitude,
    @required this.latitude,
    @required this.phone,
    @required this.websiteUrl,
    @required this.updatedAt,
  });

  factory Brewery.fromJson(Map<String, dynamic> json) {
    return Brewery(
      id: json['id'] as int,
      name: json['name'] as String,
      breweryType: json['brewery_type'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postal_code'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      phone: json['phone'] as String,
      websiteUrl: json['website_url'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'name': name,
        'brewery_type': breweryType,
        'street': street,
        'city': city,
        'state': state,
        'postal_code': postalCode,
        'longitude': longitude,
        'latitude': latitude,
        'phone': phone,
        'website_url': websiteUrl,
        'updated_at': updatedAt,
      };
}
