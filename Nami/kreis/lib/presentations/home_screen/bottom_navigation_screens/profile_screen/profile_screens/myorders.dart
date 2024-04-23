import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/widgets/orders_card.dart';
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
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Orders'.tr(),
      ),
      body: Consumer<ProfileProvider>(builder: (context, provider, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: CustomButton(
                      width: 166,
                      height: 56,
                      title: 'Current'.tr(),
                      fontColor: provider.cur ? white : greyColor,
                      bg: provider.cur ? mainColor : containerBorder,
                      onTap: () => provider.changeOrders(true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: CustomButton(
                      width: 166,
                      height: 56,
                      fontColor: !provider.cur ? white : greyColor,
                      title: 'Previous'.tr(),
                      bg: !provider.cur ? mainColor : containerBorder,
                      onTap: () => provider.changeOrders(false),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 698,
              child: ListView.builder(
                itemCount: provider.orders.length,
                itemBuilder: (context, index) {
                  List orders = provider.orders;
                  return OrdersCard(
                    id: orders[0][0]['id'],
                    date: orders[0][0]['date'],
                    time: orders[0][0]['time'],
                    address: orders[0][0]['address'],
                    status: provider.cur,
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
