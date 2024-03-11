import 'package:flutter/material.dart';
import 'package:kreis/presentation/profile_page/profile_page.dart';
import 'package:kreis/presentation/category_page/categories.dart';
import 'package:kreis/presentation/home_page/home.dart';

class HomeProvider extends ChangeNotifier {
  int selectedindex = 0;
  List<Widget> pages = [const HomePage(), const CategoryPage(), const ProfilePage()];
  void updateSelectedIndex(int index) {
    selectedindex = index;
    notifyListeners();
  }
}
