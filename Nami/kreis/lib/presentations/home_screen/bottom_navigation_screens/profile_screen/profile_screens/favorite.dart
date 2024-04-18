import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/single_item_screen/single_item.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/items_card.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).getFavorates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Favorites'.tr(),
        ),
        body: Consumer<ProfileProvider>(
          builder: (context, provider, _) {
            if (provider.isloading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              );
            } else if (provider.failedtoload) {
              return const CustomText(title: 'Error: Failed to load favorates');
            } else if (provider.favorates.isEmpty) {
              return Center(
                  child: CustomText(title: 'favorates is empty'.tr()));
            } else {
              List favorites = provider.favorates;
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: GestureDetector(
                        onTap: () => NavigatorHandler.push(SingleItemScreen(
                          itemId: favorites[index].id,
                          index: index,
                          cId: favorites[index].categoryId,
                          sId: favorites[index].subCategoryId,
                        )),
                        child: ItemsCard(
                          title: favorites[index].title!,
                          image: favorites[index].image!,
                          price: favorites[index].price,
                          isFavorite: favorites[index].isFavorite,
                          ontap: () {
                            provider.changeFavorite(
                                Preferences().getUserData().userToken!,
                                favorites[index].id,
                                index);
                            Provider.of<HomeProvider>(context, listen: false)
                                .getLatestProducts();
                          },
                        ),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
