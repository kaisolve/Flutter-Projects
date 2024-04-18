import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/map_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_tile/custom_tile.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PayCheckPage extends StatefulWidget {
  num price;
  PayCheckPage({super.key, required this.price});

  @override
  State<PayCheckPage> createState() => _PayCheckPageState();
}

class _PayCheckPageState extends State<PayCheckPage> {
  // ignore: non_constant_identifier_names
  // var map_address = "add address";

  // ignore: non_constant_identifier_names
  var add_notes = "add notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Invoice'.tr(), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 343,
                height: 260,
                decoration: BoxDecoration(
                    color: mainColor.withAlpha(20),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    CustomListTile(
                      arrow: false,
                      icon: 'location',
                      text: 'Address'.tr(),
                      subtext: Provider.of<MapProvider>(context).location,
                    ),
                    CustomListTile(
                      arrow: false,
                      icon: 'address_pointer',
                      text: 'Address'.tr(),
                      subtext: Provider.of<MapProvider>(context).location,
                    ),
                    CustomListTile(
                      arrow: false,
                      icon: 'cash',
                      text: 'Payment Method'.tr(),
                      subtext: 'Cash'.tr(),
                    ),
                    CustomListTile(
                      arrow: false,
                      icon: 'notes',
                      text: 'Notes'.tr(),
                      subtext: add_notes,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Container(
                  width: 343,
                  height: 292,
                  decoration: BoxDecoration(
                    color: containerBorder,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        title: 'Products'.tr(),
                        fontWeight: FontWeight.w400,
                        fontColor: greyColor,
                      ),
                      Consumer<CartProvider>(builder: (context, provider, _) {
                        return SizedBox(
                          width: 311,
                          height: 96,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.cartItems.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> product =
                                  provider.cartItems[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      title: product['name'].split(' ')[0] +
                                          ' ' +
                                          product['name'].split(' ')[1]),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CustomText(
                                          title:
                                              'X${product['amount'].toString()}',
                                          fontColor: greyColor,
                                        ),
                                      ),
                                      CustomText(
                                        title: product['price'].toString(),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      }),
                      const Divider(
                        color: greyColor,
                      ),
                      CustomListTile(
                          text: 'Use Points & delevery'.tr(),
                          subtext: 'points',
                          icon: 'checkpoint',
                          arrow: false),
                      const Divider(
                        color: greyColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              title: '${'Total'.tr()}: ',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              title: '${widget.price} ${'Coin'.tr()}',
                              fontSize: fontR18,
                              // fontColor: mainColor,
                              style: AppTextStyles()
                                  .normalText()
                                  .textColorBold(mainColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
        child: CustomButton(
          title: 'Send Order'.tr(),
          onTap: () {},
        ),
      ),
      // GestureDetector(
      //   onTap: () {},
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
      //     child: Container(
      //       width: 343,
      //       height: 45,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(12),
      //         color: mainColor,
      //       ),
      //       child: Center(
      //         child: Text('Send Order'.tr(),
      //             style: const TextStyle(color: white)),
      //       ),
      //     ),
      //   ),
      // )
    );
  }
}