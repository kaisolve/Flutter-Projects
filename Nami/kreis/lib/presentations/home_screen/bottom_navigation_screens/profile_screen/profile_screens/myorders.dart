import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Orders'.tr(),
      ),
      body: Column(
        children: [
          Consumer<ProfileProvider>(builder: (context, provider, _) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: CustomButton(
                    width: 166,
                    height: 56,
                    title: 'Current'.tr(),
                    onTap: () => provider.changeOrders(true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: CustomButton(
                    width: 166,
                    height: 56,
                    title: 'Current'.tr(),
                    onTap: () => provider.changeOrders(false),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
