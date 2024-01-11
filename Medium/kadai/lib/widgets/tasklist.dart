import 'package:flutter/material.dart';
import 'package:kadai/models/category_data.dart';
import 'package:kadai/widgets/taskrow.dart';
import 'package:provider/provider.dart';
import '../screens/task.dart';

class TaskList extends StatelessWidget {
  static String taskN = "";
  final String categoryN;
  const TaskList({super.key, required this.categoryN});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        builder: (context, CategoryData, child) {
      return ListView.builder(
        itemCount: CategoryData.getRelevantCategory(categoryN).tasksList.length,
        itemBuilder: (context, index) {
          String taskName = CategoryData.getRelevantCategory(categoryN)
              .tasksList[index]
              .taskName;
          return TaskRow(
              taskN: taskName,
              onTap: () {
                Navigator.pushNamed(context, Tasks.id);
                taskN = taskName;
              },
              star: (p0) {
                CategoryData.addStar(taskName);
              },
              date: (p0) {},
              del: (p0) {
                CategoryData.delTask(categoryN, taskName);
              },
              text: taskName);
        },
      );
    });
  }
}
