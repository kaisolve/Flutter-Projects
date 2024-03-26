import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class BuyButtonContainer extends StatelessWidget {
  void Function() ontap;
  num price;
  String text;
  BuyButtonContainer(
      {super.key,
      required this.ontap,
      required this.price,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 69,
      decoration: const BoxDecoration(
          color: input2Bg,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomText(title: '${'Total'.tr()}: $price ${'Coin'.tr()}'),
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
                    child: CustomText(
                      title: text.tr(),
                      fontColor: white,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
