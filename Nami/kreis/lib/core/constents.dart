import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kreis/features/categories/presentation/pages/categories.dart';
import 'package:kreis/features/home/presentation/pages/home.dart';
import 'package:kreis/features/maps/presentation/pages/map.dart';
import 'package:kreis/features/settings/presentation/pages/settings.dart';

const languages = [Locale('ar'), Locale('en')];

const List<Widget> pages = <Widget>[
  HomePage(),
  CategoryPage(),
  MapPage(),
  SettingPage(),
];

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

const buttonbar = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    backgroundColor: Colors.black,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.category),
    label: 'Category',
    backgroundColor: Colors.black,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.map),
    label: 'Location',
    backgroundColor: Colors.black,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'Settings',
    backgroundColor: Colors.black,
  ),
];
