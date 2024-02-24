import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/presentation/category_page/categories.dart';
import 'package:kreis/presentation/home_page/widgets/productview.dart';
import 'package:kreis/widgets/custom_app_bar/app_bar.dart';
import 'package:kreis/presentation/home_page/widgets/categoriesview.dart';
import 'package:kreis/presentation/home_page/widgets/headers.dart';
// import 'package:kreis/presentation/home_page/widgets/items_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(page: 'dsd', arrow: false),
      body: Column(
        children: [
          const Row(),
          HomeHeaders(
            text1: "categories".tr(),
            text2: "more".tr(),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryPage()),
            ),
          ),
          const CategoryView(),
          HomeHeaders(
            text1: "new_items".tr(),
            text2: "more".tr(),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryPage()),
            ),
          ),
          const ProductsView(),
        ],
      ),

      // return CircularProgressIndicator();
    );
  }
}
