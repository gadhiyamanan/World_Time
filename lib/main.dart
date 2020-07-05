import 'package:World_map/Screens/Home.dart';
import 'package:World_map/Screens/choose_location.dart';
import 'package:flutter/material.dart';
import 'package:World_map/Screens/loading.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Chooselocation()
  }));
}
