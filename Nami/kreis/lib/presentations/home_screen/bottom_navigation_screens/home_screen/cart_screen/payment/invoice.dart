import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/payment/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/map_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/main_app_layout/main_app_layout.dart';
import 'package:kreis/presentations/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_loader_overlay/loader_overlay.dart';
import 'package:kreis/presentations/widgets/custom_rich_text/rich_text.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_tile/custom_tile.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PayCheckPage extends StatefulWidget {
  const PayCheckPage({
    super.key,
  });

  @override
  State<PayCheckPage> createState() => _PayCheckPageState();
}

class _PayCheckPageState extends State<PayCheckPage> {
  ProfileProvider profileProvider = getIt();
  PaymentProvider paymentProvider = getIt();
  CartProvider cartProvider = getIt();
  MapProvider mapProvider = getIt();
  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    mapProvider = Provider.of<MapProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Invoice'.tr(), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: SizedBox(
          width: 375,
          height: 660,
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
                        subtext: mapProvider.location,
                      ),
                      CustomListTile(
                        arrow: false,
                        icon: 'address_pointer',
                        text: 'Address'.tr(),
                        subtext: mapProvider.location,
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
                        subtext: paymentProvider.notes.text,
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<PaymentProvider>(builder: (context, provider, _) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                      width: 343,
                      height: 350,
                      decoration: BoxDecoration(
                        color: containerBorder,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                title: 'Products'.tr(),
                                fontWeight: FontWeight.w400,
                                fontColor: greyColor,
                              ),
                            ),
                          ),
                          Consumer<CartProvider>(
                              builder: (context, provider, _) {
                            return SizedBox(
                              width: 311,
                              height: 260,
                              child: ListView.builder(
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
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: CustomText(
                                              title:
                                                  'X${product['amount'].toString()}',
                                              fontColor: greyColor,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomRichText(children: [
                                              TextSpan(
                                                  text: '${product['price']} ',
                                                  style: AppTextStyles()
                                                      .normalText(fontSize: 18)
                                                      .textColorBold(black)),
                                              TextSpan(
                                                  text: 'Coin'.tr(),
                                                  style: AppTextStyles()
                                                      .normalText(
                                                          fontSize: fontR14)
                                                      .textColorNormal(
                                                          greyColor))
                                            ]),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                    title: '${'Total'.tr()}: ',
                                    style: AppTextStyles()
                                        .normalText(fontSize: 16)
                                        .textColorBold(black)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomRichText(children: [
                                  TextSpan(
                                      text: '${cartProvider.totalPrice} ',
                                      style: AppTextStyles()
                                          .normalText(fontSize: 18)
                                          .textColorBold(mainColor)),
                                  TextSpan(
                                      text: 'Coin'.tr(),
                                      style: AppTextStyles()
                                          .normalText(fontSize: fontR14)
                                          .textColorNormal(mainColor))
                                ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
        child: CustomButton(
            title: 'Send Order'.tr(),
            onTap: () async {
              List details = [];
              for (var item in cartProvider.cartItems) {
                details.add({
                  "product_id": item['id'],
                  "qty": item['amount'],
                  "net_cost": item['price']
                });
              }
              paymentProvider.storeOrders(
                  address: mapProvider.location,
                  lat: mapProvider.lat!,
                  lng: mapProvider.lng!,
                  notes: paymentProvider.notes.text,
                  total: cartProvider.totalPrice,
                  details: details);
              await LoadingOverlay.of(context)
                  .during(Future.delayed(const Duration(seconds: 1)));
              await showDialog<String>(
                // ignore: use_build_context_synchronously
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  surfaceTintColor: input2Bg,
                  title: const CustomAssetImage(
                    assetName: 'order',
                    width: 303,
                    height: 203,
                  ),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                        title: 'Your Order Has been Sent Successfully'.tr()),
                  ),
                ),
              );
              paymentProvider.notes.clear();
              NavigatorHandler.pushAndRemoveUntil(const MainAppLayout());
            }),
      ),
    );
  }
}
