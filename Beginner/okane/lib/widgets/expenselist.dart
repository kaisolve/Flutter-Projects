import 'package:flutter/material.dart';
import 'package:okane/widgets/row2.dart';
import 'package:provider/provider.dart';
import '../models/budget_data.dart';

class ExpenseList extends StatelessWidget {
  final String budgetTitle;
  const ExpenseList({super.key, required this.budgetTitle});

  @override
  Widget build(BuildContext context) {
    return Consumer<BudgetData>(
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        builder: (context, BudgetData, child) {
      return ListView.builder(
          itemCount: BudgetData.numOfExpenseInBudget(budgetTitle),
          itemBuilder: (BuildContext context, int index) {
            return Row2(
              price: BudgetData.getRelevantBudget(budgetTitle)
                  .expenses[index]
                  .price,
              title: BudgetData.getRelevantBudget(budgetTitle)
                  .expenses[index]
                  .title,
              ontap: () => BudgetData.deleteExpense(
                  budgetTitle,
                  BudgetData.getRelevantBudget(budgetTitle)
                      .expenses[index]
                      .title),
            );
          });
    });
  }
}
