import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/repositories/items_repository.dart';
import 'package:kreis/data/repositories/profile_repository.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/single_item_screen/single_item.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/items_card.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Favorite'.tr(),
        ),
        body: FutureBuilder(
          future: ProfileRepository().getFavorite(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List favorites = snapshot.data!;

              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: GestureDetector(
                        onTap: () => NavigatorHandler.push(
                            SingleItemScreen(itemId: favorites[index].id)),
                        child: ItemsCard(
                          title: favorites[index].title!,
                          image: favorites[index].image!,
                          price: favorites[index].price,
                          isFavorite: favorites[index].isFavorite,
                          ontap: () {
                            ItemsRepository().addDelFavorites(
                                Preferences().getUserData()!.userToken!,
                                favorites[index].id);
                          },
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              // Display an error message
              return Text('Error: ${snapshot.error}');
            } else {
              // Display a loading indicator
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}
