import 'package:flutter/material.dart';
import 'package:okane/models/budget.dart';
import 'package:okane/models/expense.dart';
import 'package:okane/models/hive_database.dart';

class BudgetData extends ChangeNotifier {
  final db = HiveData();

  List<Budget> budgetList = [];

  void initializeBudgetList() {
    // db.delAll();
    if (db.previousDataExists()) {
      budgetList = db.readFromDatabase();
    } else {
      db.saveToDatabase(budgetList);
    }
  }

  List<Budget> getBudgetList() {
    return db.readFromDatabase();
  }

  int getBudgetCount() {
    return budgetList.length;
  }

  int numOfExpenseInBudget(String budgetTitle) {
    Budget relevantBudget = getRelevantBudget(budgetTitle);
    return relevantBudget.expenses.length;
  }

  int getBudgetExpensesSum(String budgetTitle) {
    int sum = 0;
    for (int i = 0; i < numOfExpenseInBudget(budgetTitle); i++) {
      sum += getRelevantBudget(budgetTitle).expenses[i].price;
    }
    return sum;
  }

  void addBudget(String title, int budget) {
    budgetList.add(Budget(title: title, budget: budget, expenses: []));
    db.saveToDatabase(budgetList);

    notifyListeners();
  }

  void addExpense(
    String budgetTitle,
    String title,
    int price,
  ) {
    Budget relevantBudget = getRelevantBudget(budgetTitle);
    relevantBudget.expenses.add(Expenses(title: title, price: price));
    db.saveToDatabase(budgetList);

    notifyListeners();
  }

  void deleteExpense(String budgetTitle, String expenseTitle) {
    Budget relevantBudget = getRelevantBudget(budgetTitle);
    Expenses relevantExpense = getRelevantExpense(budgetTitle, expenseTitle);
    relevantBudget.expenses.remove(relevantExpense);
    db.saveToDatabase(budgetList);

    notifyListeners();
  }

  void deleteBudget(
    String budgetTitle,
  ) {
    Budget relevantBudget = getRelevantBudget(budgetTitle);
    budgetList.remove(relevantBudget);
    db.saveToDatabase(budgetList);

    notifyListeners();
  }

  Budget getRelevantBudget(String budgetTitle) {
    Budget relevantBudget =
        budgetList.firstWhere((budget) => budget.title == budgetTitle);
    return relevantBudget;
  }

  Expenses getRelevantExpense(String budgetTitle, String expenseTitle) {
    Budget relevantBudget = getRelevantBudget(budgetTitle);
    Expenses relevantExpense = relevantBudget.expenses
        .firstWhere((expense) => expense.title == expenseTitle);
    return relevantExpense;
  }
}
