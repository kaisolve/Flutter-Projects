import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dimens/dimens.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color fontColor;
  final FontWeight? fontWeight;

  final Color bg;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  EdgeInsetsGeometry? padding;

  CustomButton(
      {super.key,
      required this.title,
      this.fontSize = fontR14,
      this.fontWeight = FontWeight.normal,
      this.fontColor = white,
      this.bg = mainColor,
      required this.onTap,
      this.width,
      this.height,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        width: width ?? Dimens.width,
        height: height ?? 56.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xff707070)),
          color: bg,
        ),
        child: CustomText(
          title: title,
          fontSize: fontSize,
          fontColor: fontColor,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
