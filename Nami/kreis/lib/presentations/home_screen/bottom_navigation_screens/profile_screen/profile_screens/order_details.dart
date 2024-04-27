import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/data/models/order_model.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/widgets/orders_card.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_loader_overlay/loader_overlay.dart';
import 'package:kreis/presentations/widgets/custom_rich_text/rich_text.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_tile/custom_tile.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SingleOrder extends StatefulWidget {
  String? id;
  SingleOrder({super.key, required this.id});

  @override
  State<SingleOrder> createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false)
        .getSingleOrder(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Order Details'.tr(),
      ),
      body: Consumer<ProfileProvider>(builder: (context, provider, _) {
        if (provider.isloading) {
          return const Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else if (provider.failedtoload) {
          return const CustomText(title: 'Error: Failed to load order');
        } else {
          OrderDetailsModel order = provider.singleOrder;
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
              width: 450,
              height: 773,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                    child: Container(
                      width: 343,
                      height: 153,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(11, 0, 20, 15),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: mainColor.withAlpha(20),
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: mainColor,
                                      )),
                                  child: const CustomSvgIcon(
                                    assetName: 'recieved',
                                    width: 19.03,
                                    height: 24,
                                  ),
                                ),
                              ),
                              CustomText(
                                title: 'Order Is Recieved'.tr(),
                              ),
                            ],
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 331,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: containerBorder,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Container(
                                  width: 331 / 6,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(100)),
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 12, 14, 12),
                                      child: CustomButton(
                                        title: 'Edit'.tr(),
                                        onTap: () {},
                                        width: 143.5,
                                        height: 48,
                                        bg: white,
                                        border: Border.all(color: mainColor),
                                        fontColor: mainColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 12, 14, 12),
                                      child: CustomButton(
                                        title: 'Cancel'.tr(),
                                        onTap: () async {
                                          provider.cancelOrder(order.id!);
                                          provider.getOrders('new');
                                          await LoadingOverlay.of(context)
                                              .during(Future.delayed(
                                                  const Duration(seconds: 1)));
                                          NavigatorHandler.pop();
                                        },
                                        width: 143.5,
                                        height: 48,
                                        bg: white,
                                        border: Border.all(color: black),
                                        fontColor: black,
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
                  ),
                  Column(
                    children: [
                      Center(
                        child: Container(
                          width: 343,
                          height: 380,
                          decoration: BoxDecoration(
                              color: mainColor.withAlpha(20),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 8),
                                child: CustomTextIcons(
                                  padding:
                                      const EdgeInsets.fromLTRB(23, 8, 23, 8),
                                  icon: 'qr',
                                  text: order.id.toString(),
                                  style: AppTextStyles()
                                      .normalText(fontSize: fontR18)
                                      .textColorBold(mainColor),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                child: CustomTextIcons(
                                    padding:
                                        const EdgeInsets.fromLTRB(23, 8, 23, 8),
                                    icon: 'calender',
                                    text: '${order.date} - ${order.time}'),
                              ),
                              CustomListTile(
                                arrow: false,
                                icon: 'branch',
                                text: 'Address'.tr(),
                                subtext: order.address,
                              ),
                              CustomListTile(
                                arrow: false,
                                icon: 'address_pointer',
                                text: 'Address'.tr(),
                                subtext: order.address,
                              ),
                              CustomListTile(
                                arrow: false,
                                icon: 'cash',
                                text: 'Payment Method'.tr(),
                                subtext: order.payType,
                              ),
                              CustomListTile(
                                arrow: false,
                                icon: 'notes',
                                text: 'Notes'.tr(),
                                subtext: order.notes,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Container(
                            width: 343,
                            height: 227,
                            decoration: BoxDecoration(
                              color: containerBorder,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 8, 0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CustomText(
                                      title: 'Products'.tr(),
                                      fontWeight: FontWeight.w400,
                                      fontColor: greyColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 311,
                                  height: 120,
                                  child: ListView.builder(
                                    itemCount:
                                        provider.singleOrder.details?.length,
                                    itemBuilder: (context, index) {
                                      var product =
                                          provider.singleOrder.details?[index];
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                              title: product['product']['title']
                                                      .split(' ')[0] +
                                                  ' ' +
                                                  product['product']['title']
                                                      .split(' ')[1]),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: CustomText(
                                                  title:
                                                      'X${product['qty'].toString()}',
                                                  fontColor: greyColor,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    CustomRichText(children: [
                                                  TextSpan(
                                                      text:
                                                          '${product['net_cost']} ',
                                                      style: AppTextStyles()
                                                          .normalText(
                                                              fontSize: 18)
                                                          .textColorBold(
                                                              black)),
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
                                ),
                                const Divider(
                                  color: greyColor,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            text:
                                                ' ${provider.singleOrder.netTotal} ',
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
