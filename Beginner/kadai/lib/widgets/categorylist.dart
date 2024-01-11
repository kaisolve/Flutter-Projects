import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category_data.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});
  static String category = "Work";
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    List list = Provider.of<CategoryData>(context).categoryList;
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (value) {
        setState(() {
          CategoryList.category = value;
        });
      },
      itemBuilder: (context) => list
          .map((item) => PopupMenuItem<String>(
                value: item.categoryName,
                child: Text(
                  item.categoryName,
                ),
              ))
          .toList(),
      child: Text(
        CategoryList.category,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
