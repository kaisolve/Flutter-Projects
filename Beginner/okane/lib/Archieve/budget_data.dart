import 'package:flutter/material.dart';
import 'package:okane/Archieve/budget.dart';
import 'dart:collection';

class BudgetData extends ChangeNotifier {
  final List<Budgets> _budgets = [
    Budgets(
        title: 'title', price: 1000, icon: const Icon(Icons.abc), slider: '70'),
  ];

  UnmodifiableListView<Budgets> get budgets {
    return UnmodifiableListView(_budgets);
  }

  // ignore: non_constant_identifier_names
  int get BudgetCount {
    return _budgets.length;
  }

  void addBudget(String title, int price, Icon icon, String slider) {
    final budget =
        Budgets(title: title, price: price, icon: icon, slider: slider);
    _budgets.add(budget);
    notifyListeners();
  }

  void deleteBudget(Budgets budget) {
    _budgets.remove(budget);
    notifyListeners();
  }
}
