import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sonam_web_app/model/brewery.dart';

class DatabaseManager {
  static final DatabaseManager _singleton = DatabaseManager._internal();

  factory DatabaseManager() => _singleton;

  DatabaseManager._internal();

  static DatabaseManager get databaseManager => _singleton;

  static const BREWERIES = 'breweries';
  static const LIST_SIZE = 'list_size';

  void initializeHive() async{
    Hive.registerAdapter(BreweryAdapter());
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  void saveBreweries(List<Brewery> breweries) async {
    final _breweryBox = await Hive.openBox(BREWERIES);
    _breweryBox.put(LIST_SIZE,breweries.length);
    for( var i = 0 ; i < breweries.length; i++) {
      _breweryBox.put(i,breweries.elementAt(i));
    }
  }

  Future<List<Brewery>> getBreweries() async {
    final _breweryBox = await Hive.openBox(BREWERIES);
    var listSize = _breweryBox.get(LIST_SIZE);
    List<Brewery> breweries = List();
    for( var i = 0 ; i < listSize; i++) {
      breweries.add(_breweryBox.get(i));
    }
    return breweries;
  }

  Future<bool> hasBreweries() async{
    final _breweryBox = await Hive.openBox(BREWERIES);
    return _breweryBox.isNotEmpty;
  }

  void deleteBreweries() async {
    final _breweryBox = await Hive.openBox(BREWERIES);
    _breweryBox.deleteFromDisk();
  }
}
