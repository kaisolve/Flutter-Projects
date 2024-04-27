import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/categories_screen/categories.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/home_headers.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/icon_container.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/image_slider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/productview.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/cart_screen.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/items.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/categoriesview.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  ProfileProvider profileProvider = getIt();
  @override
  void initState() {
    super.initState();
    profileProvider.getUser();
  }

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
              // children: [TextSpan(text: ' Welcome '.tr())],
              text:
                  '${profileProvider.user.fname} ${profileProvider.user.lname}'),
        ),
        actions: [
          IconContainer(
              image: 'basket',
              ontap: () {
                NavigatorHandler.push(const CartPage());
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 370,
              height: 54,
              child: CustomTextFormField(
                controller: textEditingController,
                hint: 'Specific Item.. ?'.tr(),
                prefix: const CustomSvgIcon(
                  assetName: 'search',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const ImageSlider(),
            HomeHeaders(
              text1: "Categories".tr(),
              text2: "Show All >".tr(),
              onPressed: () => NavigatorHandler.push(const CategoryPage()),
            ),
            const CategoryView(),
            HomeHeaders(
              text1: "Newest Products".tr(),
              text2: "Show All >".tr(),
              onPressed: () => NavigatorHandler.push(
                ItemsPage(
                  cId: null,
                  sId: null,
                ),
              ),
            ),
            const ProductsView(),
          ],
        ),
      ),
    );
  }
}
