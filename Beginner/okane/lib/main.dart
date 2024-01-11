import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:okane/models/budget_data.dart';
import 'package:okane/Archieve/expense_data.dart';
import 'package:okane/screens/addbudget.dart';
import 'package:okane/screens/addexpense.dart';
import 'package:okane/screens/home.dart';
import 'package:okane/screens/trans.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("budget_database");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseData()),
        ChangeNotifierProvider(create: (_) => BudgetData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => const Home(),
        Trans.id: (context) => const Trans(budgetName: ''),
        AddExpense.id: (context) => const AddExpense(
              budgetTitle: '',
            ),
        Addbudget.id: (context) => const Addbudget(),
      },
    );
  }
}
