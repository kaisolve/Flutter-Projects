import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuyButtonContainer extends StatelessWidget {
  void Function() ontap;
  int price;
  BuyButtonContainer({super.key, required this.ontap, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 69,
      decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('${'total '.tr()} $price${' coin'.tr()}'),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: ontap,
                child: Container(
                  width: 141,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color(0xffdf1c26),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'add_item + icon'.tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
