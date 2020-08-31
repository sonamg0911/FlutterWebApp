import 'package:flutter/material.dart';
import 'package:sonam_web_app/widgets/brewery_list_page.dart';
import 'database/database_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseManager.databaseManager.initializeHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BreweryListPage(),
    );
  }
}