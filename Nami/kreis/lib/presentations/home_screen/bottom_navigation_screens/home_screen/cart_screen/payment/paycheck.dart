import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/payment/payment.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';

class PayCheckPage extends StatelessWidget {
  const PayCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'paycheck'.tr(), showBackArrow: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 343,
                  height: 260,
                  decoration: BoxDecoration(
                      color: const Color(0xffdf1c26).withAlpha(5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      CustomListTile(
                        arrow: false,
                        image: 'assets/images/svgs/location.svg',
                        text: 'address'.tr(),
                        subtext: 'map address',
                      ),
                      CustomListTile(
                        arrow: false,
                        image: 'assets/images/svgs/location.svg',
                        text: 'address'.tr(),
                        subtext: 'map address',
                      ),
                      CustomListTile(
                        arrow: false,
                        image: 'assets/images/svgs/location.svg',
                        text: 'address'.tr(),
                        subtext: 'map address',
                      ),
                      CustomListTile(
                        arrow: false,
                        image: 'assets/images/svgs/location.svg',
                        text: 'address'.tr(),
                        subtext: 'map address',
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
                color: const Color(0xffdf1c26),
              ),
              child: Center(
                child: Text('send_order'.tr(),
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ));
  }
}
