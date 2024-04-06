import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/payment/paycheck.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/payment/widgets/custom_tile.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/widgets/buttom_container.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/map_page/maps.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_rich_text/rich_text.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PaymentPage extends StatefulWidget {
  num price;
  PaymentPage({super.key, required this.price});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late CartProvider cartProvider;

  // ignore: non_constant_identifier_names
  var map_address = "add address";

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.getcartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment'.tr(), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                width: 343,
                height: 400,
                decoration: BoxDecoration(
                    color: mainColor.withAlpha(20),
                    borderRadius: BorderRadius.circular(12)),
                child: Consumer<CartProvider>(
                  builder: (context, provider, child) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.cartItems.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> product =
                            provider.cartItems[index];
                        return ListTile(
                          leading: SizedBox(
                            width: 72,
                            height: 48,
                            child: Image.network(
                              product['image'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: CustomText(
                              title: product['name'].split(' ')[0] +
                                  ' ' +
                                  product['name'].split(' ')[1]),
                          subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  title: '${product['amount']}X',
                                  fontColor: mainColor,
                                ),
                                CustomRichText(
                                  children: [
                                    TextSpan(
                                        text: '${'Total'.tr()} : ',
                                        style: AppTextStyles()
                                            .normalText()
                                            .textColorNormal(black)),
                                    TextSpan(
                                        text:
                                            '${provider.getItemPrice(product['id'])} ',
                                        style: AppTextStyles()
                                            .normalText()
                                            .textColorBold(mainColor)),
                                    TextSpan(
                                        text: 'Coin'.tr(),
                                        style: AppTextStyles()
                                            .normalText()
                                            .textColorNormal(mainColor)),
                                  ],
                                ),
                              ]),
                          trailing: const CustomText(title: ''),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: CustomListTile(
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MapPage(),
                  ));
                },
                arrow: true,
                image: 'location',
                text: 'Address'.tr(),
                subtext: map_address,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: CustomListTile(
                ontap: () {},
                arrow: true,
                image: 'cash',
                text: 'Payment Method'.tr(),
                subtext: 'Cash'.tr(),
              ),
            ),
            SizedBox(
              width: 343,
              height: 165,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Notes'.tr(),
                ),
                maxLines: 5,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BuyButtonContainer(
        text: 'Confirm'.tr(),
        price: widget.price,
        ontap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PayCheckPage(),
        )),
      ),
    );
  }
}
