import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  String text;
  String? subtext;
  String? icon;
  String? trailingIcon;
  bool arrow;
  void Function()? ontap;
  Color? tileColor;
  CustomListTile(
      {super.key,
      required this.text,
      this.subtext,
      this.icon,
      required this.arrow,
      this.trailingIcon,
      this.tileColor,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 343,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: arrow
              ? Border.all(
                  width: 1,
                  color: containerBorder,
                )
              : null,
          // color: tileColor == null ? null : input2Bg,
        ),
        child: ListTile(
          leading: icon != null ? CustomSvgIcon(assetName: icon!) : null,
          title: CustomText(
            title: text,
            fontColor: greyColor,
            fontWeight: FontWeight.w400,
          ),
          subtitle: CustomText(
            title: subtext,
            style: AppTextStyles().normalText().textColorBold(black),
            fontWeight: FontWeight.w400,
          ),
          trailing: arrow
              ? const Icon(Icons.arrow_forward_ios_rounded)
              : trailingIcon != null
                  ? CustomSvgIcon(assetName: trailingIcon!)
                  : null,
        ),
      ),
    );
  }
}
