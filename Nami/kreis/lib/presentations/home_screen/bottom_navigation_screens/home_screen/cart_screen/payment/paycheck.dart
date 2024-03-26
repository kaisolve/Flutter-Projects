import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/payment/widgets/custom_tile.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';

class PayCheckPage extends StatefulWidget {
  const PayCheckPage({super.key});

  @override
  State<PayCheckPage> createState() => _PayCheckPageState();
}

class _PayCheckPageState extends State<PayCheckPage> {
  // ignore: non_constant_identifier_names
  var map_address = "add address";

  // ignore: non_constant_identifier_names
  var add_notes = "add notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Paycheck'.tr(), showBackArrow: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 343,
                  height: 260,
                  decoration: BoxDecoration(
                      color: mainColor.withAlpha(5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      CustomListTile(
                        arrow: false,
                        image: 'location',
                        text: 'Address'.tr(),
                        subtext: 'map address',
                      ),
                      CustomListTile(
                        arrow: false,
                        image: 'location',
                        text: 'Address'.tr(),
                        subtext: 'map address',
                      ),
                      CustomListTile(
                        arrow: false,
                        image: 'cash',
                        text: 'Payment Mathod'.tr(),
                        subtext: 'Cash'.tr(),
                      ),
                      CustomListTile(
                        arrow: false,
                        image: 'note',
                        text: 'Note'.tr(),
                        subtext: add_notes,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
            child: Container(
              width: 343,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: mainColor,
              ),
              child: Center(
                child: Text('Send Order'.tr(),
                    style: const TextStyle(color: white)),
              ),
            ),
          ),
        ));
  }
}
