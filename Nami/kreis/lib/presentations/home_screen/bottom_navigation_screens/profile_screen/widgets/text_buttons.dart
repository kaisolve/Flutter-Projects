import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  String icon;
  String text;
  bool arrow;
  void Function() onPressed;
  CustomTextButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed,
      required this.arrow});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CustomSvgIcon(
              assetName: icon,
              width: 36,
              height: 36,
            ),
            CustomText(
              title: text,
              fontColor: arrow ? black : redColor,
            ),
          ],
        ),
        Visibility(
            visible: arrow, child: const CustomSvgIcon(assetName: 'arrow')),
      ]),
    );
  }
}
