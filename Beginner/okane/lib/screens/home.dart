import 'package:flutter/material.dart';
import 'package:okane/screens/addbudget.dart';
import 'package:okane/screens/trans.dart';
import 'package:okane/widgets/budgetlist.dart';
// import 'package:okane/widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../models/budget_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = 'home';
  static late String title;
  static late String price;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // deleteFromDisk();
    super.initState();

    Provider.of<BudgetData>(context, listen: false).initializeBudgetList();
  }

  @override
  Widget build(BuildContext context) {
    String getDate() {
      var now = DateTime.now();
      String date = now.day.toString();
      String month = now.month.toString();
      String year = now.year.toString();
      return '$date/$month/$year';
    }

    int getBudgetSum() {
      int sum = 0;
      int num = Provider.of<BudgetData>(context).getBudgetCount();
      for (int j = 0; j < num; j++) {
        sum += Provider.of<BudgetData>(context).budgetList[j].budget;
      }
      return sum;
    }

    int getExpensesSum() {
      Trans.price = 0;
      int num = Provider.of<BudgetData>(context).getBudgetCount();
      // ignore: unused_local_variable
      for (int j = 0; j < num; j++) {
        String bTitle = Provider.of<BudgetData>(context).budgetList[j].title;
        int count =
            Provider.of<BudgetData>(context).numOfExpenseInBudget(bTitle);
        for (int i = 0; i < count; i++) {
          Trans.price += Provider.of<BudgetData>(context)
              .getRelevantBudget(bTitle)
              .expenses[i]
              .price;
        }
      }
      return Trans.price;
    }

    return Scaffold(
      extendBodyBehindAppBar: false,
      // drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const Addbudget(),
                  ),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8, top: 8, bottom: 8),
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              getDate(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       icon: const Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Icon(
        //           Icons.menu,
        //           size: 30,
        //           color: Colors.black,
        //         ),
        //       ),
        //     );
        //   },
        // ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            getExpensesSum().toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 27),
          ),
          const Text(
            'spent',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black87,
                fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          const Expanded(
            child: BudgetList(),
          ),
          Container(
            color: const Color.fromARGB(255, 218, 210, 232),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Left for Savings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '\$${getBudgetSum() - getExpensesSum()}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
