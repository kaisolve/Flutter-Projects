import 'package:flutter/material.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/repositories/home_repository.dart';
import 'package:kreis/data/repositories/items_repository.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/items_card.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/items.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late HomeRepository homeRepository;

  @override
  void initState() {
    super.initState();
    homeRepository = HomeRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FutureBuilder(
        future: homeRepository.getLatestProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List productsItems = snapshot.data!;
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
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ItemsPage(
                        cId: productsItems[index].categoryId,
                        sId: productsItems[index].subCategoryId,
                      ),
                    )),
                    child: ItemsCard(
                      title: productsItems[index].title,
                      image: productsItems[index].image,
                      price: productsItems[index].price,
                      isFavorite: productsItems[index].isFavorite,
                      ontap: () {
                        // ItemsRepository().addDelFavorites(token, productId);
                        ItemsRepository().addDelFavorites(
                            Preferences().getUserData()!.userToken!,
                            productsItems[index].id);
                      },
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            // Display an error message
            return Text('Error: ${snapshot.error}');
          } else {
            // Display a loading indicator
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
