import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/categories_screen/categories.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/home.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_page.dart';

class LayoutProvider extends ChangeNotifier {
  int selectedindex = 0;
  List<Widget> pages = [
    const HomePage(),
    const CategoryPage(),
    const ProfilePage(),
  ];

  void updateSelectedIndex(int index) {
    selectedindex = index;
    notifyListeners();
  }
}
