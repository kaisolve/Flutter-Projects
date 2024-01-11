import 'package:flutter/material.dart';
import 'package:okane/screens/trans.dart';
import 'package:okane/widgets/row.dart';
import 'package:provider/provider.dart';
import '../models/budget_data.dart';

class BudgetList extends StatelessWidget {
  const BudgetList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void goToBudgetPage(String budgetName) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Trans(
            budgetName: budgetName,
          ),
        ),
      );
    }

    return Consumer<BudgetData>(
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        builder: (context, BudgetData, child) {
      return ListView.builder(
          itemCount: BudgetData.getBudgetCount(),
          itemBuilder: (BuildContext context, int index) {
            final budget = BudgetData.budgetList[index];
            // Trans.price += budget.price;
            return GestureDetector(
              onDoubleTap: () => BudgetData.deleteBudget(budget.title),
              child: RowW(
                ontap: () {
                  goToBudgetPage(budget.title);
                },
                text: budget.title,
                money: budget.budget,
              ),
            );
          });
    });
  }
}
