import 'package:database/database.dart';
import 'package:sonam_web_app/model/brewery.dart';
import 'dart:developer';

class DatabaseManager {
  static final DatabaseManager _singleton = DatabaseManager._internal();

  factory DatabaseManager() => _singleton;

  DatabaseManager._internal();

  static DatabaseManager get databaseManager => _singleton;

  static const BREWERIES = 'breweries';

  final database = MemoryDatabaseAdapter().database();

  void saveBreweries(List<Brewery> breweries) {
    // Our collection
    final collection = database.collection(BREWERIES);

    breweries.forEach((brewery) async {
      // Our document
      final document = collection.newDocument();

      // Insert a brewery
      await document.insert(data :{
        'id': brewery.id,
        'name': brewery.name,
        'brewery_type': brewery.brewery_type,
        'street': brewery.street,
        'city': brewery.city,
        'state': brewery.state,
        'postal_code': brewery.postal_code,
        'longitude': brewery.longitude,
        'phone': brewery.phone,
        'website_url': brewery.website_url,
        'updated_at': brewery.updated_at
      },
      reach:Reach.regional)
          .then((value) => log('brewery added'))
          .catchError((error) => log("Failed to add brewery: $error"));
    });

  }

  Future<List<Brewery>> getBreweries() async {
    // Our collection
    final collection = database.collection(BREWERIES);

    // Define what we are searching
    final query = Query(); //right now getting everything in the collection

    // Send query to the database
    final result = await collection.search(query: query, reach: Reach.regional);

    List<Brewery> breweries = List();
    // For each brewery
    for (var snapshot in result.items) {
      Brewery brewery = Brewery(
          id: snapshot.data['id'] as int,
          name: snapshot.data['name'] as String,
          brewery_type: snapshot.data['brewery_type'] as String,
          street: snapshot.data['street'] as String,
          city: snapshot.data['city'] as String,
          state: snapshot.data['state'] as String,
          postal_code: snapshot.data['postal_code'] as String,
          longitude: snapshot.data['longitude'] as String,
          latitude: snapshot.data['latitude'] as String,
          phone: snapshot.data['phone'] as String,
          website_url: snapshot.data['website_url'] as String,
          updated_at: snapshot.data['updated_at'] as String);

      breweries.add(brewery);
    }

    return breweries;
  }

  bool hasBreweries() {
    return database
        .collection(BREWERIES).collectionId != null;
  }

  void deleteBreweries() {
    database
        .collection(BREWERIES)
        .searchAndDelete(query: Query(), reach: Reach.regional);
  }
}
