import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/repositories/home_repository.dart';
import 'package:kreis/data/repositories/items_repository.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/items_card.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/single_item_screen/single_item.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemsPage extends StatefulWidget {
  int? cId;
  int? sId;
  ItemsPage({
    this.cId,
    this.sId,
    super.key,
  });

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  HomeRepository homeRepository = HomeRepository();
  ItemsRepository itemsRepository = ItemsRepository();

  @override
  Widget build(BuildContext context) {
    widget.cId != null
        ? Provider.of<ItemsProvider>(context, listen: false).categories_id =
            widget.cId!
        : widget.cId;
    widget.sId != null
        ? Provider.of<ItemsProvider>(context, listen: false).sub_categories_id =
            widget.sId!
        : widget.sId;

    return Scaffold(
      appBar: CustomAppBar(title: 'Products'.tr(), showBackArrow: true),
      body: FutureBuilder(
        future: homeRepository.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List categories = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Search Bar

                  // Categories Horizontal List
                  Padding(
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
                            },
                            child: Container(
                              width: 129,
                              height: 40,
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: categories[index].id ==
                                            Provider.of<ItemsProvider>(context,
                                                    listen: false)
                                                .categories_id
                                        ? const Color(0xffDF1C26)
                                        : const Color(0xffDF1C26).withAlpha(5),
                                    width: 1),
                                color: const Color(0xffDF1C26).withAlpha(5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                  child: CustomText(
                                      title: categories[index].title)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Subcategories Horizontal List
                  FutureBuilder(
                    future: homeRepository.getSubCategories(
                        Provider.of<ItemsProvider>(context).categories_id),
                    builder: (context, subCategoriesSnapshot) {
                      if (subCategoriesSnapshot.connectionState ==
                          ConnectionState.done) {
                        List subCategories = subCategoriesSnapshot.data!;
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
                                    Provider.of<ItemsProvider>(context,
                                            listen: false)
                                        .updateSId(subCategories[index].id);
                                  },
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: subCategories[index].id ==
                                                  Provider.of<ItemsProvider>(
                                                          context,
                                                          listen: false)
                                                      .sub_categories_id
                                              ? const Color(0xffDF1C26)
                                              : const Color(0xffF9F9F9),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            title: subCategories[index].title,
                                            maxLines: 1,
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      } else if (subCategoriesSnapshot.hasError) {
                        return Text(
                            'Error fetching subcategories: ${subCategoriesSnapshot.error}');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),

                  const SizedBox(height: 16),

                  FutureBuilder(
                    future: itemsRepository.getProductsByCategoryAndSubcategory(
                        Provider.of<ItemsProvider>(context).categories_id,
                        Provider.of<ItemsProvider>(context).sub_categories_id),
                    builder: (context, productsSnapshot) {
                      if (productsSnapshot.connectionState ==
                          ConnectionState.done) {
                        List products = productsSnapshot.data!;
                        return SingleChildScrollView(
                          child: SizedBox(
                            width: 375,
                            height: 630,
                            child: GridView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => SingleItemScreen(
                                        itemId: products[index].id,
                                      ),
                                    ));
                                  },
                                  child: ItemsCard(
                                    title: products[index].title!,
                                    image: products[index].image!,
                                    price: products[index].price,
                                    isFavorite: products[index].isFavorite,
                                    ontap: () {
                                      itemsRepository.addDelFavorites(
                                          Preferences()
                                              .getUserData()!
                                              .userToken!,
                                          products[index].id);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      } else if (productsSnapshot.hasError) {
                        return Text(
                            'Error fetching products: ${productsSnapshot.error}');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}



























// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:kreis/data/repositories/home_repository.dart';
// import 'package:kreis/data/repositories/items_repository.dart';
// import 'package:kreis/presentation/home_page/widgets/items_card.dart';
// import 'package:kreis/presentation/items_page/provider/provider.dart';
// import 'package:kreis/presentation/items_page/single_item.dart/single_item.dart';
// import 'package:kreis/widgets/custom_app_bar/app_bar.dart';
// import 'package:provider/provider.dart';

// // ignore: must_be_immutable
// class ItemsPage extends StatefulWidget {
//   int? cId;
//   int? sId;
//   ItemsPage({
//     this.cId,
//     this.sId,
//     super.key,
//   });

//   @override
//   State<ItemsPage> createState() => _ItemsPageState();
// }

// class _ItemsPageState extends State<ItemsPage> {
//   late HomeRepository homeRepository;
//   late ItemsRepository itemsRepository;

//   @override
//   void initState() {
//     super.initState();
//     homeRepository = HomeRepository();
//     itemsRepository = ItemsRepository();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // widget.cId != null
//     //     ? Provider.of<ItemsProvider>(context, listen: false).categories_id =
//     //         widget.cId!
//     //     : widget.cId;
//     // widget.sId != null
//     //     ? Provider.of<ItemsProvider>(context, listen: false).sub_categories_id =
//     //         widget.sId!
//     //     : widget.sId;
//     return Scaffold(
//       appBar: CustomAppbar(page: "items".tr(), arrow: true),
//       body: FutureBuilder(
//         future: homeRepository.getCategories(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             List categories = snapshot.data!;
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Search Bar

//                   // Categories Horizontal List
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
//                     child: Container(
//                       color: const Color(0xffDF1C26).withAlpha(5),
//                       width: 375,
//                       height: 56,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: categories.length,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               Provider.of<ItemsProvider>(context, listen: false)
//                                   .updateSelectedIndex(index);
//                               Provider.of<ItemsProvider>(context, listen: false)
//                                   .updateCId(categories[index].id);
//                             },
//                             child: Container(
//                               width: 129,
//                               height: 40,
//                               padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: categories[index].id ==
//                                             Provider.of<ItemsProvider>(context,
//                                                     listen: false)
//                                                 .categories_id
//                                         ? const Color(0xffDF1C26)
//                                         : const Color(0xffDF1C26).withAlpha(5),
//                                     width: 1),
//                                 color: const Color(0xffDF1C26).withAlpha(5),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child:
//                                   Center(child: CustomText(categories[index].title)),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),

//                   // Subcategories Horizontal List
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
//                     child: SizedBox(
//                       width: 375,
//                       height: 42,
//                       child: Consumer<ItemsProvider>(
//                         builder: (context, value, child) {
//                           int selectedCategoryIndex = value.selectedindex;
//                           print(categories[0].title);
//                           List subcategories = categories.firstWhere(
//                               (element) =>
//                                   element['category_id']['id'] == widget.cId);
//                           print(subcategories);
//                           // categories[selectedCategoryIndex].subCategories;
//                           return ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: subcategories.length,
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   value.updateSubSelectedIndex(index);
//                                   value.updateSId(subcategories[index].id);
//                                 },
//                                 child: Container(
//                                   width: 109,
//                                   height: 42,
//                                   padding: const EdgeInsets.all(12),
//                                   decoration: BoxDecoration(
//                                     color: subcategories[index].id ==
//                                             Provider.of<ItemsProvider>(context,
//                                                     listen: false)
//                                                 .sub_categories_id
//                                         ? const Color(0xffDF1C26)
//                                         : const Color(0xffF9F9F9),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: Center(
//                                       child: CustomText(subcategories[index].title)),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 16),

//                   // Product Rows
//                   FutureBuilder(
//                     future: itemsRepository.getProductsByCategoryAndSubcategory(
//                         Provider.of<ItemsProvider>(context).categories_id,
//                         Provider.of<ItemsProvider>(context).sub_categories_id),
//                     builder: (context, snapshot) {
//                       return Consumer<ItemsProvider>(
//                         builder: (context, value, child) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             List products = snapshot.data!;
//                             return SingleChildScrollView(
//                               child: SizedBox(
//                                 width: 375,
//                                 height: 630,
//                                 child: GridView.builder(
//                                   gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                   ),
//                                   itemCount: products.length,
//                                   itemBuilder: (context, index) {
//                                     return GestureDetector(
//                                       onTap: () {
//                                         Navigator.of(context)
//                                             .push(MaterialPageRoute(
//                                           builder: (context) => SingleItemPage(
//                                             itemId: products[index].id,
//                                           ),
//                                         ));
//                                       },
//                                       child: ItemsCard(
//                                         title: products[index].title!,
//                                         image: products[index].image!,
//                                         price: products[index].price,
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             );
//                           } else if (snapshot.hasError) {
//                             return CustomText('Error: ${snapshot.error}');
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       );
//                     },
//                   )
//                 ],
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return CustomText('Error: ${snapshot.error}');
//           } else {
//             return const CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }