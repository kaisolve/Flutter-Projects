import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/categories_screen/categories.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/home_headers.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/icon_container.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/image_slider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/productview.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/cart_screen.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/items.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/categoriesview.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const Padding(
          padding: EdgeInsets.only(right: 4.0),
          child: CustomSvgIcon(
            assetName: 'cart',
            width: 32,
            height: 22.04,
          ),
        ),
        homeText: Text.rich(
          TextSpan(
              children: [TextSpan(text: 'Welcome '.tr())],
              text: 'Welcome '.tr()),
        ),
        actions: [
          IconContainer(
              image: 'basket',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(),
            const ImageSlider(),
            HomeHeaders(
              text1: "Categories".tr(),
              text2: "Show All >".tr(),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryPage()),
              ),
            ),
            const CategoryView(),
            HomeHeaders(
              text1: "Newest Products".tr(),
              text2: "Show All >".tr(),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemsPage(
                          cId: null,
                          sId: null,
                        )),
              ),
            ),
            const ProductsView(),
          ],
        ),
      ),
    );
  }
}
