import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Row2 extends StatelessWidget {
  const Row2(
      {super.key,
      required this.price,
      required this.title,
      required this.ontap});
  final int price;
  final String title;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    String getDate() {
      var now = DateTime.now();
      String date = now.day.toString();
      String month = now.month.toString();
      return '$date/$month';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(child: Icon(Icons.arrow_downward_outlined)),
        ),
        Column(
          children: [Text(price.toString()), Text(title)],
        ),
        const SizedBox(
          width: 150,
        ),
        Text(
          getDate(),
          style: const TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: ontap, child: const Icon(Icons.remove_circle)),
        ),
      ],
    );
  }
}
