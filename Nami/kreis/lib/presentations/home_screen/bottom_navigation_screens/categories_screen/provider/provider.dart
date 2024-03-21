import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  int selectedindex = 0;
  void updateSelectedIndex(int index) {
    selectedindex = index;
    notifyListeners();
  }
}
