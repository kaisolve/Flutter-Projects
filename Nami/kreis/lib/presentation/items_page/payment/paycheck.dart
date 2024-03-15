import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/presentation/items_page/payment/payment.dart';
import 'package:kreis/widgets/custom_app_bar/app_bar.dart';

class PayCheckPage extends StatelessWidget {
  const PayCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(page: 'basket'.tr(), arrow: true),
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
            padding: EdgeInsets.fromLTRB(12, 24, 12, 24),
            child: Container(
              width: 343,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffdf1c26),
              ),
              child: Center(
                child: Text('send_order'.tr(),
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ));
  }
}
