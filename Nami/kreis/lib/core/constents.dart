import 'dart:ui';

import 'package:flutter/material.dart';

const languages = [Locale('ar'), Locale('en')];

// const List<Widget> _pages = <Widget>[
//   HomePage(),
//   CategoriesPage(),
//   MapPage(),
//   SettingsPage(),
// ];

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
