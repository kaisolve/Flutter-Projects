import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/data/models/category_model.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_widgets/custom_card.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          if (provider.isloading) {
            return const CircularProgressIndicator(
              color: mainColor,
            );
          } else if (provider.failedtoload) {
            return const CustomText(title: 'Error: Failed to load categories');
          } else if (provider.categories.isEmpty) {
            return const CustomText(title: 'No categories available');
          } else {
            List<CategoryModel> categoryItems = provider.categories;
            return SizedBox(
              width: 343,
              height: 288,
              child: Column(
                children: [
                  CategoriesRows(start: 0, list: categoryItems),
                  CategoriesRows(start: 4, list: categoryItems),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class CategoriesRows extends StatelessWidget {
  final int start;
  final List<CategoryModel> list;

  const CategoriesRows({
    super.key,
    required this.start,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (subIndex) {
        if (start + subIndex < list.length) {
          final item = list[start + subIndex];
          return CustomCard(title: item.title!, image: item.image!);
        } else {
          return const SizedBox(); // Return empty SizedBox if index exceeds list length
        }
      }),
    );
  }
}
