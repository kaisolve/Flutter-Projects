import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/categories_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/items.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_widgets/custom_card.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getLatestProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Categories'.tr(),
          showBackArrow: false,
        ),
        body: Consumer<HomeProvider>(
          builder: (context, provider, _) {
            if (provider.isloading) {
              return const CircularProgressIndicator(
                color: mainColor,
              );
            } else if (provider.failedtoload) {
              return const Text('Error: Failed to load products');
            } else if (provider.latestProducts.isEmpty) {
              return const Text('No products available');
            } else {
              List categories = provider.categories;
              return Row(
                children: [
                  // Left side - Scrollable list of categories
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 102,
                      height: 656,
                      child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Consumer<CategoriesProvider>(
                            builder: (context, provider, child) {
                              return GestureDetector(
                                onTap: () {
                                  provider.updateSelectedIndex(index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: CustomCard(
                                    image: categories[index].image,
                                    title: categories[index].title,
                                    color: provider.selectedindex == index
                                        ? mainColor
                                        : white,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),

                  // Divider line
                  const VerticalDivider(),
                  // Right side - ListView.builder of items related to the selected category
                  Expanded(
                      flex: 3,
                      child: Consumer<CategoriesProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            itemCount: categories[provider.selectedindex]
                                .subCategories
                                .length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: CustomText(
                                    title: categories[provider.selectedindex]
                                        .subCategories[index]
                                        .title),
                                onTap: () => NavigatorHandler.push(ItemsPage(
                                  cIndex: provider.selectedindex,
                                  sIndex: index,
                                  cId: categories[provider.selectedindex].id,
                                  sId: categories[provider.selectedindex]
                                      .subCategories[index]
                                      .id,
                                )),
                              );
                            },
                          );
                        },
                      )),
                ],
              );
            }
          },
        ));
  }
}
