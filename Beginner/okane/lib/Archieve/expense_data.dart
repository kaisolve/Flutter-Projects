import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:okane/models/expense.dart';

class ExpenseData extends ChangeNotifier {
  final List<Expenses> _expenses = [
    Expenses(
      title: 'title',
      price: 100,
    ),
    Expenses(
      title: 'totke',
      price: 200,
    ),
  ];

  UnmodifiableListView<Expenses> get expenses {
    return UnmodifiableListView(_expenses);
  }

  // ignore: non_constant_identifier_names
  int get ExpenseCount {
    return _expenses.length;
  }

  void addExpense(String title, int price, String date) {
    final expense = Expenses(
      title: title,
      price: price,
    );
    _expenses.add(expense);
    notifyListeners();
  }

  void deleteExpense(Expenses expense) {
    _expenses.remove(expense);
    notifyListeners();
  }
}
