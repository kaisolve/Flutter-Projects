import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/presentations/auth/provider/auth_provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/categories_screen/categories.dart';
import 'package:kreis/presentations/home_screen/widgets/image_slider.dart';
import 'package:kreis/presentations/home_screen/widgets/productview.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/cart_screen.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/items.dart';
import 'package:kreis/presentations/home_screen/widgets/categoriesview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<AuthProvider>(context).userData.cityId);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/images/svgs/circle.svg'),
        ),
        actions: [
          IconContainer(
              image: 'assets/images/svgs/basket.svg',
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

// ignore: must_be_immutable
class HomeHeaders extends StatelessWidget {
  final String text1, text2;
  void Function()? onPressed;

  HomeHeaders(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text1,
              style: AppTextStyles()
                  .normalText(fontSize: 18)
                  .textColorBold(black)),
        ),
        Row(
          children: [
            TextButton(
                onPressed: onPressed,
                child: Text(
                  text2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xffDF1C26)),
                )),
          ],
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class IconContainer extends StatelessWidget {
  String image;
  void Function() ontap;
  IconContainer({super.key, required this.image, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(16),
                color: const Color(0xffeeeeee)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(image),
            )),
      ),
    );
  }
}
