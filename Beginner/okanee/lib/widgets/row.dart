import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:okane/models/budget_data.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RowW extends StatefulWidget {
  RowW({
    super.key,
    required this.text,
    required this.money,
    required this.ontap,
  });
  String text;
  int money;
  void Function()? ontap;
  @override
  State<RowW> createState() => _RowWState();
}

class _RowWState extends State<RowW> {
  Icon _icon = const Icon(Icons.monetization_on);
  final Color _color = Colors.deepPurple;
  @override
  Widget build(BuildContext context) {
    double exensesSum = Provider.of<BudgetData>(context)
        .getBudgetExpensesSum(widget.text)
        .toDouble();
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, right: 18, left: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            child: CircleAvatar(
              backgroundColor: _color,
              radius: 17,
              child: _icon,
            ),
            onTap: () async {
              final IconData? icon = await FlutterIconPicker.showIconPicker(
                  context,
                  iconPackModes: [IconPack.cupertino]);
              _icon = Icon(icon);
              debugPrint('Picked Icon:  $icon');
              setState(() {});
            },
          ),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.text,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: exensesSum.toInt().toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: exensesSum.toInt() > widget.money
                                      ? Colors.red
                                      : Colors.black),
                            ),
                            TextSpan(
                              text: '/${widget.money.toString()}',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: LinearPercentIndicator(
                    backgroundColor: Colors.deepPurple.shade100,
                    width: 300,
                    barRadius: const Radius.circular(5),
                    percent: exensesSum / widget.money > 1
                        ? 1
                        : exensesSum / widget.money,
                    progressColor: exensesSum.toInt() > widget.money
                        ? Colors.red
                        : Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: widget.ontap,
            child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.deepPurple.shade100,
                child: const Icon(
                  Icons.add,
                  color: Colors.deepPurple,
                )),
          ),
        ],
      ),
    );
  }
}
