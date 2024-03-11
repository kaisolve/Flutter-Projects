import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemsProvider extends ChangeNotifier {
  int selectedindex = 0;
  int subselectedindex = 0;

  int categories_id = 39;
  int sub_categories_id = 172;
  int n = 1;
  List<String>? basket_items;
  // int items_index
  void updateSelectedIndex(int index) {
    selectedindex = index;
    notifyListeners();
  }

  void updateSubSelectedIndex(int index) {
    subselectedindex = index;
    notifyListeners();
  }

  void updateCId(int cId) {
    categories_id = cId;
    notifyListeners();
  }

  void updateSId(int sId) {
    sub_categories_id = sId;
    notifyListeners();
  }

  void updateNum(int cond) {
    cond == 0 ? n++ : n--;
    notifyListeners();
  }

  Future<void> addToSP(String text, List<String> itemDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(text, itemDetails);
    notifyListeners();
  }

  Future<List<String>?> getFromSP(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    basket_items = prefs.getStringList(text); // image, text, price
    notifyListeners();
    return null;
  }
}
