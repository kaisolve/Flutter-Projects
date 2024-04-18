import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/single_item_screen/single_item.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/items_card.dart';
import 'package:kreis/presentations/widgets/custom_loader_overlay/loader_overlay.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  bool _isLatestProductsFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLatestProductsFetched) {
      Provider.of<HomeProvider>(context, listen: false).getLatestProducts();
      _isLatestProductsFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<HomeProvider>(builder: (context, provider, _) {
        if (provider.isloading) {
          return const CircularProgressIndicator(
            color: mainColor,
          );
        } else if (provider.failedtoload) {
          return const CustomText(title: 'Error: Failed to load products');
        } else if (provider.latestProducts.isEmpty) {
          return const CustomText(title: 'No products available');
        } else {
          List productsItems = provider.latestProducts;
          return SizedBox(
            width: 375,
            height: 904.33,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: productsItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    NavigatorHandler.push(SingleItemScreen(
                        index: index,
                        itemId: productsItems[index].id,
                        cId: productsItems[index].categoryId,
                        sId: productsItems[index].subCategoryId));
                  },
                  child: ItemsCard(
                    title: productsItems[index].title,
                    image: productsItems[index].image,
                    price: productsItems[index].price,
                    isFavorite: productsItems[index].isFavorite,
                    ontap: () async {
                      provider.changeFavorite(
                          Preferences().getUserData().userToken!,
                          productsItems[index].id,
                          index);
                      await LoadingOverlay.of(context)
                          .during(Future.delayed(const Duration(seconds: 1)));
                    },
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
