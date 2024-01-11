import 'package:flutter/material.dart';
import 'package:kadai/models/category_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddSubTask extends StatefulWidget {
  int n;
  AddSubTask({super.key, required this.n});

  @override
  State<AddSubTask> createState() => _AddSubTaskState();
}

class _AddSubTaskState extends State<AddSubTask> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      builder: (BuildContext context, CategoryData, Widget? child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.n,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: const TextField(
                // controller: taskN,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Add subTask',
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(30))
                ),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    // delete subtask
                    setState(() {
                      widget.n--;
                    });
                  },
                  child: const Icon(Icons.close)),
            );
          },
        );
      },
    );
  }
}
