import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/items_card.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/single_item_screen/single_item.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemsPage extends StatefulWidget {
  num? cId;
  num? sId;

  ItemsPage({
    this.cId,
    this.sId,
    super.key,
  });

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late ItemsProvider itemsProvider;
  late HomeProvider homeProvider;
  // bool _shouldReloadProducts = true;

  @override
  void initState() {
    super.initState();
    homeProvider = getIt();
    itemsProvider = getIt();
  }

  @override
  Widget build(BuildContext context) {
    widget.cId != null
        ? Provider.of<ItemsProvider>(context, listen: false).categoryId =
            widget.cId!
        : widget.cId =
            Provider.of<ItemsProvider>(context, listen: false).categoryId;
    widget.sId != null
        ? Provider.of<ItemsProvider>(context, listen: false).subCategoryId =
            widget.sId!
        : widget.sId =
            Provider.of<ItemsProvider>(context, listen: false).subCategoryId;
    Provider.of<HomeProvider>(context, listen: false).getSubCategories(
        Provider.of<ItemsProvider>(context, listen: false).categoryId);
    Provider.of<ItemsProvider>(context, listen: false)
        .getProductsByCategoryAndSubcategory(
            Provider.of<ItemsProvider>(context, listen: false).categoryId,
            Provider.of<ItemsProvider>(context, listen: false).subCategoryId);
    return Scaffold(
      appBar: CustomAppBar(title: 'Products'.tr(), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Categories Horizontal List
            Consumer<HomeProvider>(
              builder: (context, provider, _) {
                if (provider.isloading) {
                  return const CircularProgressIndicator(color: mainColor);
                } else if (provider.failedtoload) {
                  return const Text('Error: Failed to load categories');
                } else if (provider.categories.isEmpty) {
                  return const Text('No categories available');
                } else {
                  List categories = provider.categories;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                    child: Container(
                      color: const Color(0xffDF1C26).withAlpha(5),
                      width: 375,
                      height: 56,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Provider.of<ItemsProvider>(context, listen: false)
                                  .updateCId(categories[index].id);
                              // Update subcategories based on the selected category ID
                              Provider.of<HomeProvider>(context, listen: false)
                                  .getSubCategories(Provider.of<ItemsProvider>(
                                          context,
                                          listen: false)
                                      .categoryId);
                            },
                            child: Container(
                              width: 129,
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: categories[index].id ==
                                          Provider.of<ItemsProvider>(context)
                                              .categoryId
                                      ? const Color(0xffDF1C26)
                                      : const Color(0xffDF1C26).withAlpha(5),
                                  width: 1,
                                ),
                                color: const Color(0xffDF1C26).withAlpha(5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child:
                                    CustomText(title: categories[index].title),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            // Subcategories Horizontal List
            Consumer<HomeProvider>(
              builder: (context, provider, _) {
                if (provider.isloading) {
                  return const CircularProgressIndicator(color: mainColor);
                } else if (provider.failedtoload) {
                  return const Text('Error: Failed to load subCategories');
                } else if (provider.subCategories.isEmpty) {
                  return const Text('No subCategories available');
                } else {
                  List subCategories =
                      Provider.of<HomeProvider>(context, listen: false)
                          .subCategories;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: SizedBox(
                      width: 375,
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: subCategories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Provider.of<ItemsProvider>(context, listen: false)
                                  .updateSId(subCategories[index].id);
                              Provider.of<ItemsProvider>(context, listen: false)
                                  .getProductsByCategoryAndSubcategory(
                                      Provider.of<ItemsProvider>(context,
                                              listen: false)
                                          .categoryId,
                                      Provider.of<ItemsProvider>(context,
                                              listen: false)
                                          .subCategoryId);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: subCategories[index].id ==
                                        Provider.of<ItemsProvider>(context)
                                            .subCategoryId
                                    ? const Color(0xffDF1C26)
                                    : const Color(0xffF9F9F9),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: CustomText(
                                  title: subCategories[index].title,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            // Products Grid
            Consumer<ItemsProvider>(
              builder: (context, provider, _) {
                if (provider.isloading) {
                  return const CircularProgressIndicator(color: mainColor);
                } else if (provider.failedtoload || provider.products.isEmpty) {
                  return const Text('There Is No products');
                } else {
                  List products = provider.products;
                  return SizedBox(
                    width: 375,
                    height: 630,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SingleItemScreen(
                                itemId: products[index].id,
                                index: index,
                              ),
                            ));
                          },
                          child: ItemsCard(
                            title: products[index].title!,
                            image: products[index].image!,
                            price: products[index].price,
                            isFavorite: products[index].isFavorite,
                            ontap: () {
                              provider.changeFavorite(
                                  Preferences().getUserData().userToken!,
                                  products[index].id!,
                                  index);
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
