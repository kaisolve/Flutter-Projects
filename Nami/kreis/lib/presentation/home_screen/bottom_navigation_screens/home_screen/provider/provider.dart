import 'package:flutter/material.dart';
import 'package:kreis/presentation/home_screen/bottom_navigation_screens/profile_screen/profile_page.dart';
import 'package:kreis/presentation/home_screen/bottom_navigation_screens/categories_screen/categories.dart';
import 'package:kreis/presentation/home_screen/bottom_navigation_screens/home_screen/home.dart';

class HomeProvider extends ChangeNotifier {
  int selectedindex = 0;
  List<Widget> pages = [
    const HomePage(),
    const CategoryPage(),
    // const ProfilePage()
  ];
  void updateSelectedIndex(int index) {
    selectedindex = index;
    notifyListeners();
  }
}