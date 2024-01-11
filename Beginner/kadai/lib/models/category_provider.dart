import 'package:flutter/material.dart';
import 'category.dart';

class CategoryProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Category> _categories;

  CategoryProvider(this._categories);

  List<Category> get categories => _categories;

  void toggleStar(int index, int tindex) {
    _categories[index].tasksList[tindex].isStarred =
        !_categories[index].tasksList[tindex].isStarred;
    notifyListeners();
  }
}
