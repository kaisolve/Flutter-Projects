// import 'package:flutter/material.dart';
// import 'package:okane/models/budget_data.dart';
// import 'package:okane/screens/trans.dart';
// import 'package:okane/widgets/row.dart';
// import 'package:provider/provider.dart';

// class BudgetList extends StatelessWidget {
//   const BudgetList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BudgetData>(
//         // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
//         builder: (context, BudgetData, child) {
//       return ListView.builder(
//           itemCount: BudgetData.BudgetCount,
//           itemBuilder: (BuildContext context, int index) {
//             final budget = BudgetData.budgets[index];
//             Trans.price += budget.price;
//             return GestureDetector(
//               onDoubleTap: () => BudgetData.deleteBudget(budget),
//               child: RowW(
//                 ontap: () {
//                   Navigator.pushNamed(context, Trans.id);
//                 },
//                 text: budget.title,
//                 money: budget.price,
//               ),
//             );
//           });
//     });
//   }
// }
