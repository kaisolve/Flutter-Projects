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
import 'package:kreis/presentations/widgets/custom_loader_overlay/loader_overlay.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: must_be_immutable
class ItemsPage extends StatefulWidget {
  num? cId;
  num? sId;
  num? cIndex;
  num? sIndex;
  ItemsPage({
    this.cId,
    this.sId,
    this.cIndex,
    this.sIndex,
    super.key,
  });

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late ItemsProvider itemsProvider;
  late HomeProvider homeProvider;
  TextEditingController textEditingController = TextEditingController();
  List filteredProducts = [];
  ItemScrollController categoryController = ItemScrollController();
  ItemScrollController subCategoryController = ItemScrollController();
  @override
  void initState() {
    super.initState();
    homeProvider = getIt();
    itemsProvider = Provider.of<ItemsProvider>(context, listen: false);
    filteredProducts = itemsProvider.products; // Initialize with all products
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      categoryController.jumpTo(index: widget.cIndex!.toInt());
      subCategoryController.jumpTo(index: widget.sIndex!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.cId != null
        ? itemsProvider.categoryId = widget.cId!
        : widget.cId = itemsProvider.categoryId;
    widget.sId != null
        ? itemsProvider.subCategoryId = widget.sId!
        : widget.sId = itemsProvider.subCategoryId;
    Provider.of<HomeProvider>(context, listen: false)
        .getSubCategories(itemsProvider.categoryId);
    itemsProvider.getProductsByCategoryAndSubcategory(
        itemsProvider.categoryId, itemsProvider.subCategoryId);

    return Scaffold(
      appBar: CustomAppBar(title: 'Products'.tr(), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 370,
              height: 54,
              child: CustomTextFormField(
                controller: textEditingController,
                hint: 'Specific Item.. ?',
                color: containerBorder,
                prefix: const CustomSvgIcon(
                  assetName: 'search',
                  width: 20,
                  height: 20,
                ),
                onchanged: itemsProvider
                    .filterProducts, // Call filter method on text change
              ),
            ),
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
                      child: ScrollablePositionedList.builder(
                        itemScrollController: categoryController,
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              itemsProvider.updateCId(categories[index].id);
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
                      child: ScrollablePositionedList.builder(
                        itemScrollController: subCategoryController,
                        itemCount: subCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              itemsProvider.updateSId(subCategories[index].id);
                              itemsProvider.getProductsByCategoryAndSubcategory(
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
                  List products = provider.filteredProducts;
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
                                cId: products[index].categoryId,
                                sId: products[index].subCategoryId,
                              ),
                            ));
                          },
                          child: ItemsCard(
                            title: products[index].title!,
                            image: products[index].image!,
                            price: products[index].price,
                            isFavorite: products[index].isFavorite,
                            ontap: () async {
                              provider.changeFavorite(
                                  Preferences().getUserData().userToken!,
                                  products[index].id!,
                                  index);
                              Provider.of<HomeProvider>(context, listen: false)
                                  .getLatestProducts();
                              await LoadingOverlay.of(context).during(
                                  Future.delayed(const Duration(seconds: 1)));
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
