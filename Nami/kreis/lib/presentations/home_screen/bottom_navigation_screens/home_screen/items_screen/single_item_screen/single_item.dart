import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/models/cart_model.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/widgets/buttom_container.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SingleItemScreen extends StatefulWidget {
  int itemId;
  int cId;
  int sId;
  int index;
  SingleItemScreen(
      {super.key,
      required this.itemId,
      required this.cId,
      required this.sId,
      required this.index});

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  CartProvider cartProvider = getIt();
  ItemsProvider itemsProvider = getIt();
  late ProductModel item;
  bool isInSP = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartProvider = Provider.of<CartProvider>(context, listen: false);
      Provider.of<ItemsProvider>(context, listen: false)
          .setItem(widget.itemId, widget.cId, widget.sId);
      Provider.of<CartProvider>(context, listen: false).getcartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Product Details'.tr(), showBackArrow: true),
      body: Consumer<ItemsProvider>(
        builder: (context, provider, snapshot) {
          if (provider.isloading) {
            return const Center(
              child: CircularProgressIndicator(
                color: mainColor,
              ),
            );
          } else if (provider.failedtoload) {
            return const Text('Error: Failed to load item');
          } else {
            isInSP =
                Provider.of<CartProvider>(context).isItemExist(widget.itemId);
            item = provider.singleItem;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: 375,
                      height: 634.67,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 343,
                                  height: 234,
                                  child:
                                      Card(child: Image.network(item.image!)),
                                ),
                                SizedBox(
                                  width: 343,
                                  height: 42.67,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(title: item.title!),
                                      GestureDetector(
                                          onTap: () async {
                                            provider.changeFavorite(
                                                Preferences()
                                                    .getUserData()
                                                    .userToken!,
                                                item.id!,
                                                widget.index);
                                            Provider.of<HomeProvider>(context,
                                                    listen: false)
                                                .getLatestProducts();
                                          },
                                          child: CustomSvgIcon(
                                            assetName: 'heart',
                                            color: item.isFavorite == true
                                                ? mainColor
                                                : heartColor,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: 343,
                                    height: 162,
                                    child: CustomText(title: item.details!)),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 8, 12, 8),
                                    child: SizedBox(
                                        width: 343,
                                        height: 164,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: containerBorder,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 16, 8, 16),
                                                child: SizedBox(
                                                    width: 327,
                                                    height: 52,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child: CustomSvgIcon(
                                                                        assetName:
                                                                            'price')),
                                                                CustomText(
                                                                    title: 'Price'
                                                                        .tr()),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: CustomText(
                                                                title: isInSP
                                                                    ? cartProvider
                                                                        .getItemPrice(item
                                                                            .id!)
                                                                        .toString()
                                                                    : provider
                                                                        .price
                                                                        .toString(),
                                                              ),
                                                            ),
                                                          ]),
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 16, 0, 16),
                                                child: SizedBox(
                                                  width: 327,
                                                  height: 48,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        child: GestureDetector(
                                                          onTap: () => isInSP
                                                              ? cartProvider
                                                                  .decreaseItemAmount(
                                                                      item.id!)
                                                              : provider
                                                                  .updateQuantity(
                                                                      -1),
                                                          child:
                                                              const CustomSvgIcon(
                                                            assetName: 'minus',
                                                            width: 16,
                                                            height: 3.5,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                4, 12, 4, 12),
                                                        height: 48,
                                                        width: 199,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child: Center(
                                                          child: CustomText(
                                                            title: isInSP
                                                                ? cartProvider
                                                                    .getItemAmount(
                                                                        item
                                                                            .id!)
                                                                    .toString()
                                                                : provider
                                                                    .quantity
                                                                    .toString(),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        child: GestureDetector(
                                                          onTap: () => isInSP
                                                              ? cartProvider
                                                                  .increaseItemAmount(
                                                                      item.id!)
                                                              : provider
                                                                  .updateQuantity(
                                                                      1),
                                                          child:
                                                              const CustomSvgIcon(
                                                            assetName: 'add',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Consumer<ItemsProvider>(
                  builder: (context, provider, _) {
                    item = provider.singleItem;
                    return BuyButtonContainer(
                        color: isInSP ? white : mainColor,
                        text: isInSP ? 'Item In Cart'.tr() : 'Add To Cart'.tr(),
                        price: isInSP
                            ? cartProvider.getItemPrice(item.id!)
                            : provider.price,
                        fontColor: !isInSP ? white : mainColor,
                        ontap: () async {
                          Provider.of<CartProvider>(context, listen: false)
                              .addTocart(
                            CartModel(
                                id: item.id,
                                name: item.title,
                                image: item.image,
                                price: item.price,
                                amount: item.amount,
                                priceWeightUnit: item.priceWeightUnit),
                          );
                        });
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
