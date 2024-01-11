import 'package:flutter/material.dart';
import 'package:kadai/widgets/bubble.dart';
import 'package:kadai/widgets/categorylist.dart';
import 'package:provider/provider.dart';
import '../models/category_data.dart';

class Bubble extends StatefulWidget {
  const Bubble({super.key});
  static String categoryN = "Work";
  @override
  State<Bubble> createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        builder: (context, CategoryData, child) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: CategoryData.categoryList.length,
        itemBuilder: (context, index) {
          return Buble(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  CategoryList.category =
                      CategoryData.getCategorys()[index].categoryName;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  CategoryData.getCategorys()[index].categoryName,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
