import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/presentations/widgets/custom_rich_text/rich_text.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class BuyButtonContainer extends StatelessWidget {
  void Function() ontap;
  num price;
  String text;
  Color color;
  Color fontColor;
  BuyButtonContainer({
    super.key,
    required this.ontap,
    required this.color,
    required this.price,
    required this.text,
    required this.fontColor,
  });

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
              child: CustomRichText(children: [
                TextSpan(
                    text: '${'Total'.tr()}:',
                    style: AppTextStyles().normalText().textColorNormal(black)),
                TextSpan(
                    text: ' $price ',
                    style: AppTextStyles().normalText().textColorBold(black)),
                TextSpan(
                    text: 'Coin'.tr(),
                    style: AppTextStyles().normalText().textColorNormal(black)),
              ])),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: ontap,
                child: Container(
                  width: 141,
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: mainColor),
                      color: color,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: CustomText(
                      title: text.tr(),
                      fontColor: fontColor,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
