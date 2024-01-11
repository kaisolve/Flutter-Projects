import 'package:hive_flutter/hive_flutter.dart';
import 'package:okane/models/budget.dart';
import 'package:okane/models/expense.dart';

class HiveData {
  final _myBox = Hive.box("budget_database");

  void delAll() {
    _myBox.deleteFromDisk();
  }

  bool previousDataExists() {
    if (_myBox.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void saveToDatabase(List<Budget> budgets) {
    final budgetList = convertObjectToBudgetList(budgets);
    final money = convertObjectToBudgets(budgets);
    final expenseList = convertObjectToExerciseList(budgets);
    _myBox.put("BUDGETS", budgetList);
    _myBox.put("MONEY", money);
    _myBox.put("EXPENSES", expenseList);
  }

  List<Budget> readFromDatabase() {
    List<Budget> mySavedBudgets = [];
    final budgetNames = _myBox.get("BUDGETS");
    final buds = _myBox.get("MONEY");
    final expenseDetails = _myBox.get("EXPENSES");

    for (int i = 0; i < budgetNames.length; i++) {
      List<Expenses> expensesInEachBudget = [];
      for (int j = 0; j < expenseDetails[i].length; j++) {
        expensesInEachBudget.add(Expenses(
            title: expenseDetails[i][j][0].toString(),
            price: int.parse(expenseDetails[i][j][1])));
      }
      Budget budget = Budget(
          title: budgetNames[i],
          budget: int.parse(buds[i]),
          expenses: expensesInEachBudget);
      mySavedBudgets.add(budget);
    }
    return mySavedBudgets;
  }
}

List<String> convertObjectToBudgetList(List<Budget> budgets) {
  List<String> budgetList = [];
  for (int i = 0; i < budgets.length; i++) {
    budgetList.add(
      budgets[i].title,
    );
  }
  return budgetList;
}

List<String> convertObjectToBudgets(List<Budget> budgets) {
  List<String> budgetList = [];
  for (int i = 0; i < budgets.length; i++) {
    budgetList.add(budgets[i].budget.toString());
  }
  return budgetList;
}

List<List<List<String>>> convertObjectToExerciseList(List<Budget> budgets) {
  List<List<List<String>>> expenseList = [];
  for (int i = 0; i < budgets.length; i++) {
    List<Expenses> expenseInBudget = budgets[i].expenses;
    List<List<String>> individualBudget = [];
    for (int j = 0; j < expenseInBudget.length; j++) {
      List<String> individualExpense = [];
      individualExpense.addAll(
        [
          expenseInBudget[j].title,
          expenseInBudget[j].price.toString(),
        ],
      );
      individualBudget.add(individualExpense);
    }
    expenseList.add(individualBudget);
  }
  return expenseList;
}
