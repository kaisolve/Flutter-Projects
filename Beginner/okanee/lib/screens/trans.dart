import 'package:flutter/material.dart';
import 'package:okane/models/budget_data.dart';
import 'package:okane/screens/addexpense.dart';
import 'package:okane/widgets/expenselist.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Trans extends StatefulWidget {
  final String budgetName;
  const Trans({super.key, required this.budgetName});
  static String id = 'trans';
  static int price = 0;
  static int max = 0;

  @override
  State<Trans> createState() => _TransState();
}

class _TransState extends State<Trans> {
  @override
  Widget build(BuildContext context) {
    int getPrice() {
      Trans.price = 0;
      int count = Provider.of<BudgetData>(context)
          .numOfExpenseInBudget(widget.budgetName);
      // ignore: unused_local_variable
      for (int i = 0; i < count; i++) {
        setState(() {
          Trans.price += Provider.of<BudgetData>(context)
              .getRelevantBudget(widget.budgetName)
              .expenses[i]
              .price;
        });
      }
      return Trans.price;
    }

    int getMax() {
      setState(() {
        Trans.max = Provider.of<BudgetData>(context)
            .getRelevantBudget(widget.budgetName)
            .budget;
      });
      return Trans.max;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              widget.budgetName,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SleekCircularSlider(
          min: 0,
          max: getMax().toDouble(),
          initialValue: getPrice() < getMax()
              ? getPrice().toDouble()
              : getMax().toDouble(),
          appearance: CircularSliderAppearance(
              infoProperties: InfoProperties(
                modifier: (percentage) {
                  return 'Budget\n\t\t\$${percentage.toInt()}';
                },
              ),
              size: 350,
              customColors: CustomSliderColors(
                hideShadow: true,
                progressBarColor: Colors.deepPurple.shade300,
                trackColor: Colors.deepPurple.shade100,
                dotColor: Colors.deepPurple,
              )),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.deepPurpleAccent.shade100,
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.deepPurple.shade900,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      'Budget',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      getMax().toString(),
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.deepOrange.shade100,
                    radius: 25,
                    child: const Icon(
                      color: Colors.deepOrange,
                      Icons.arrow_downward_sharp,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      'Spent',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      '\$${getPrice().toString()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
        // ignore: prefer_const_constructors
        Expanded(
          child: ExpenseList(budgetTitle: widget.budgetName),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddExpense(budgetTitle: widget.budgetName),
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('new trans'),
              )),
        )
      ]),
    );
  }
}
