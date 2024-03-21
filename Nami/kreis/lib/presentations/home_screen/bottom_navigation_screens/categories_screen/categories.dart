import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/data/repositories/home_repository.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/categories_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/items.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_widgets/custom_card.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late HomeRepository homeRepository;
  @override
  void initState() {
    super.initState();
    homeRepository = HomeRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'categories'.tr(),
          showBackArrow: false,
        ),
        body: FutureBuilder(
          future: homeRepository.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List categories = snapshot.data!;
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
                            builder: (context, value, child) {
                              return GestureDetector(
                                onTap: () {
                                  value.updateSelectedIndex(index);
                                },
                                child: CustomCard(
                                  image: categories[index].image,
                                  title: categories[index].title,
                                  // Handle category click
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
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: categories[value.selectedindex]
                                .subCategories
                                .length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(categories[value.selectedindex]
                                      .subCategories[index]
                                      .title),
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ItemsPage(
                                                  cId: categories[
                                                          value.selectedindex]
                                                      .id,
                                                  sId: categories[
                                                          value.selectedindex]
                                                      .subCategories[index]
                                                      .id,
                                                )),
                                      ));
                            },
                          );
                        },
                      )),
                ],
              );
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
