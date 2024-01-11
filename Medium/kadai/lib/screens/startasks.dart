import 'package:flutter/material.dart';
import 'package:kadai/models/category_data.dart';
import 'package:kadai/widgets/startask.dart';
import 'package:provider/provider.dart';

class Stars extends StatefulWidget {
  const Stars({super.key});
  static String id = "star";
  static bool ind = false;
  @override
  State<Stars> createState() => _StarsState();
}

class _StarsState extends State<Stars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CategoryData>(
            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
            builder: (context, CategoryData, child) {
          return ListView.builder(
              itemCount: CategoryData.starList.length,
              itemBuilder: (context, index) {
                String taskName = CategoryData.starList[index].taskName;
                // Stars.ind =
                //     CategoryData.categoryList[index].tasksList[index].star;
                return StarRow(
                    taskN: taskName,
                    onTap: () {
                      setState(() {});
                    },
                    onStar: () {
                      // ignore: unrelated_type_equality_checks
                      if (CategoryData.starList.firstWhere(
                              (element) => element.taskName == taskName) ==
                          false) {
                        CategoryData.addStar(taskName);
                      } else {
                        CategoryData.removeStar(taskName);
                      }
                    },
                    text: taskName);
              });
        }),
      ),
    );
  }
}
