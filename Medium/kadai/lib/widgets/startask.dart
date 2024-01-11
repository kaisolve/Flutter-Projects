import 'package:flutter/material.dart';
// import 'package:kadai/models/category_data.dart';
// import 'package:provider/provider.dart';

import '../screens/startasks.dart';

class StarRow extends StatefulWidget {
  const StarRow({
    super.key,
    required this.onTap,
    required this.text,
    required this.taskN,
    required this.onStar,
  });
  final void Function()? onTap;
  final void Function()? onStar;
  final String text;
  final String taskN;

  @override
  State<StarRow> createState() => _StarRowState();
}

class _StarRowState extends State<StarRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(.0),
          child: ListTile(
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))),
            leading: GestureDetector(
                onTap: widget.onTap,
                child: Stars.ind
                    ? const Icon(Icons.check_circle_sharp)
                    : const Icon(Icons.circle_outlined)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(
                      decoration: 1 == 1
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                const Icon(Icons.link),
              ],
            ),
            trailing: GestureDetector(
              onTap: widget.onStar,
              child: 1 == 1
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
            ),
          ),
        ),
      ),
    );
  }
}
