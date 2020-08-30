import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'brewery.g.dart';

@HiveType(typeId: 0)
class Brewery extends HiveObject{
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String brewery_type;

  @HiveField(3)
  String street;

  @HiveField(4)
  String city;

  @HiveField(5)
  String state;

  @HiveField(6)
  String postal_code;

  @HiveField(7)
  String longitude;

  @HiveField(9)
  String latitude;

  @HiveField(10)
  String phone;

  @HiveField(11)
  String website_url;

  @HiveField(12)
  String updated_at;

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
