import 'package:coinzo_ticker/Views/ticker_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coinzo',
      theme: ThemeData(
        primaryColor: Colors.grey,
        primaryColorDark: Colors.grey,
        primaryColorLight: Colors.grey,
        primarySwatch: Colors.blueGrey,
      ),
      home: TickerPage(),
    );
  }
}

