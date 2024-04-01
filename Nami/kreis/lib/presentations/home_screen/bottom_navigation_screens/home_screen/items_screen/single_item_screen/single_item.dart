import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/data/models/cart_model.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/data/repositories/items_repository.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/widgets/buttom_container.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SingleItemScreen extends StatefulWidget {
  int itemId;
  SingleItemScreen({super.key, required this.itemId});

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  CartProvider cartProvider = getIt();
  ItemsRepository itemsRepository = ItemsRepository();

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(title: 'Product Details'.tr(), showBackArrow: true),
      body: FutureBuilder(
        future: Provider.of<ItemsProvider>(context).getItem(widget.itemId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            ProductModel item = snapshot.data!;

            return SingleChildScrollView(
              child: SizedBox(
                width: 375,
                height: 634.67,
                child: Column(
                  children: [
                    SizedBox(
                      width: 343,
                      height: 234,
                      child: Card(child: Image.network(item.image!)),
                    ),
                    SizedBox(
                      width: 343,
                      height: 42.67,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: item.title!),
                          GestureDetector(
                              onTap: () {},
                              child: CustomSvgIcon(
                                assetName: 'heart',
                                color:
                                    item.isFavorite == true ? mainColor : white,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 343,
                        height: 162,
                        child: CustomText(title: item.details!)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      child: SizedBox(
                        width: 343,
                        height: 164,
                        child: Container(
                          decoration: BoxDecoration(
                              color: containerBorder,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 16, 8, 16),
                                child: SizedBox(
                                    width: 327,
                                    height: 52,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: CustomSvgIcon(
                                                        assetName: 'price')),
                                                CustomText(title: 'Price'.tr()),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CustomText(
                                                title: cartProvider
                                                    .getItemPrice(item.id!)
                                                    .toString(),
                                              ),
                                            ),
                                          ]),
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                child: SizedBox(
                                  width: 327,
                                  height: 48,
                                  child: AddMinusItems(
                                    item: item,
                                    onIncrease: () {
                                      cartProvider.increaseItemAmount(item.id!);
                                    },
                                    onDecrease: () {
                                      cartProvider.decreaseItemAmount(item.id!);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: FutureBuilder<ProductModel>(
        future: Provider.of<ItemsProvider>(context).getItem(widget.itemId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: kBottomNavigationBarHeight,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return SizedBox(
              height: kBottomNavigationBarHeight,
              child: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else {
            ProductModel item = snapshot.data!;

            return BuyButtonContainer(
              text: 'Add To Cart'.tr(),
              price: cartProvider.getItemPrice(item.id!),
              ontap: () async {
                // ProductModel item =
                //     Provider.of<ItemsProvider>(context).item!;
                Provider.of<CartProvider>(context, listen: false).addTocart(
                  CartModel(
                      id: item.id,
                      name: item.title,
                      image: item.image,
                      price: item.price,
                      amount: item.amount,
                      priceWeightUnit: item.priceWeightUnit),
                );
              },
            );
          }
        },
      ),
    );
  }
}

//   bottomNavigationBar: BuyButtonContainer(
//     text: 'Add To Cart'.tr(),
//     price: item.price!.toInt(),
//     ontap: () async {
//       ProductModel item =
//           Provider.of<ItemsProvider>(context, listen: false).item!;
//       cartProvider.addTocart(CartModel(
//           id: item.id,
//           name: item.title!,
//           image: item.image!,
//           price: item.price!,
//           amount: item.amount!));
//     },
//   ),
// );
//       } else if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       } else {
//         return const CircularProgressIndicator();
//       }
//     },
//   );
// },
// );
//   }
// }
// ignore: must_be_immutable
class AddMinusItems extends StatelessWidget {
  final ProductModel item;
  final void Function() onIncrease;
  final void Function() onDecrease;

  const AddMinusItems({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    int amount = Provider.of<CartProvider>(context).getItemAmount(item.id!);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: onDecrease,
            child: SvgPicture.asset('assets/images/svgs/minus.svg'),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
          height: 48,
          width: 199,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(amount.toString()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: onIncrease,
            child: SvgPicture.asset('assets/images/svgs/add.svg'),
          ),
        ),
      ],
    );
  }
}
