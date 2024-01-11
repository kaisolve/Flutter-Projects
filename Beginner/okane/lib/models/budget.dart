import 'package:okane/models/expense.dart';

class Budget {
  Budget({required this.title, required this.budget, required this.expenses});
  String title;
  int budget;
  List<Expenses> expenses;
}
