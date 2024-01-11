import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/budget_data.dart';

class Addbudget extends StatelessWidget {
  const Addbudget({super.key});
  static String id = 'add';
  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController price = TextEditingController();

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Add Budget',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.deepPurpleAccent,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: title,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: price,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Price',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.deepPurpleAccent)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              // color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<BudgetData>(context, listen: false).addBudget(
                  title.text,
                  int.parse(price.text),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
