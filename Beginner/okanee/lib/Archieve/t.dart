// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:okane/Archieve/budget_data.dart';
// import 'package:okane/models/budget.dart';
// import 'package:okane/models/expense.dart';

// class HiveData {
//   final _myBox = Hive.box("budget_database");

//   // void createInitialData() {
//   //   budget = [];
//   // }
//   // void loadData() {
//   //   budget = _myBox.get("BUDGET");
//   // }

//   // void saveToDatabase(List<Budget> budget) {
//   //   _myBox.put("BUDGET", budget);
//   // }

//   void delAll() {
//     _myBox.deleteFromDisk();
//   }

//   bool previousDataExists() {
//     if (_myBox.isEmpty) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   void saveToDatabase(List<Budget> budgets) {
//     final budgetList = convertObjectToBudgetList(budgets);
//     final expenseList = convertObjectToExerciseList(budgets);
//     _myBox.put("BUDGETS", budgetList);
//     _myBox.put("EXPENSES", expenseList);
//   }

//   List<Budget> readFromDatabase() {
//     List<Budget> mySavedBudgets = [];
//     List<String> budgetNames = _myBox.get("BUDGETS");
//     final expenseDetails = _myBox.get("EXPENSES");

//     for (int i = 0; i < budgetNames.length; i++) {
//       List<Expenses> expensesInEachBudget = [];
//       for (int j = 0; j < expenseDetails[i].length; j++) {
//         expensesInEachBudget.add(Expenses(
//             title: expenseDetails[i][j][0].toString(),
//             price: int.parse(expenseDetails[i][j][1])));
//       }
//       Budget budget = Budget(
//           title: budgetNames[i], budget: 986, expenses: expensesInEachBudget);
//       mySavedBudgets.add(budget);
//     }
//     return mySavedBudgets;
//   }
// }

// List<String> convertObjectToBudgetList(List<Budget> budgets) {
//   List<String> budgetList = [];
//   for (int i = 0; i < budgets.length; i++) {
//     // List<String> individualBudget = [];

//     budgetList.add(
//       budgets[i].title,
//       // budgets[i].budget.toString(),
//     );
//     // budgetList.add(individualBudget);
//   }
//   return budgetList;
// }

// List<List<List<String>>> convertObjectToExerciseList(List<Budget> budgets) {
//   List<List<List<String>>> expenseList = [];
//   for (int i = 0; i < budgets.length; i++) {
//     List<Expenses> expenseInBudget = budgets[i].expenses;
//     List<List<String>> individualBudget = [];
//     for (int j = 0; j < expenseInBudget.length; j++) {
//       List<String> individualExpense = [];
//       individualExpense.addAll(
//         [
//           expenseInBudget[j].title,
//           expenseInBudget[j].price.toString(),
//         ],
//       );
//       individualBudget.add(individualExpense);
//     }
//     expenseList.add(individualBudget);
//   }
//   return expenseList;
// }
