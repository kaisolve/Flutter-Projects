import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskRow extends StatefulWidget {
  const TaskRow(
      {super.key,
      required this.onTap,
      required this.text,
      required this.taskN,
      required this.star,
      required this.date,
      required this.del});
  final void Function()? onTap;
  final void Function(BuildContext)? star;
  final void Function(BuildContext)? date;
  final void Function(BuildContext)? del;
  final String text;
  final String taskN;

  @override
  State<TaskRow> createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade200,
        ),
        child: Slidable(
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              onPressed: widget.star,
              backgroundColor: Colors.blue.shade100,
              foregroundColor: Colors.white,
              icon:
                  //  Icons.star,
                  Icons.star_border_outlined,
              label: 'Star',
            ),
            SlidableAction(
              onPressed: widget.date,
              backgroundColor: Colors.blue.shade300,
              foregroundColor: Colors.white,
              icon: Icons.date_range,
              label: 'Date',
            ),
            SlidableAction(
              onPressed: widget.del,
              backgroundColor: Colors.red.shade500,
              foregroundColor: Colors.white,
              icon: Icons.delete_forever_sharp,
              label: 'Del',
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(.0),
            child: ListTile(
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              leading: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (n == 1) {
                        n = 0;
                      } else {
                        n = 1;
                      }
                    });
                  },
                  child: n == 1
                      ? const Icon(Icons.check_circle_sharp)
                      : const Icon(Icons.circle_outlined)),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                        decoration: n == 1
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  const Icon(Icons.link),
                ],
              ),
              trailing: GestureDetector(
                  onTap: widget.onTap,
                  child: const Icon(Icons.list_alt_rounded)),
            ),
          ),
        ),
      ),
    );
  }
}
