import 'package:flutter/material.dart';
import 'package:kreis/data/models/products_model.dart';

class ItemsProvider extends ChangeNotifier {
  int selectedindex = 0;
  int subselectedindex = 0;
  int categories_id = 39;
  int sub_categories_id = 172;
  int n = 1;
  ProductModel? item;
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

  void setItems(ProductModel? data) {
    item = data;
    notifyListeners();
  }
}
