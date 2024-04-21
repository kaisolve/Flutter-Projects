import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class OrdersCard extends StatelessWidget {
  String id;
  String date;
  String time;
  String address;
  bool status;

  OrdersCard(
      {super.key,
      required this.id,
      required this.date,
      required this.time,
      required this.address,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Container(
        width: 343,
        height: !status ? 200 : 143,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: containerBorder),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: id,
                    fontWeight: FontWeight.w400,
                    style: AppTextStyles()
                        .normalText(fontSize: fontR18)
                        .textColorBold(mainColor),
                  ),
                  CustomText(
                    title: 'Details'.tr(),
                    fontColor: mainColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextIcons(icon: 'calender', text: date),
                  CustomTextIcons(icon: 'clock', text: time),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 16),
              child: CustomTextIcons(icon: 'location', text: address),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Visibility(
                    visible: !status,
                    child: Container(
                      width: 110,
                      height: 41,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: orderBorderColor,
                        ),
                      ),
                      child: Center(
                        child: CustomText(
                          title: 'Done Order'.tr(),
                          fontColor: mainColor,
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextIcons extends StatelessWidget {
  String icon;
  String text;
  CustomTextIcons({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvgIcon(
          assetName: icon,
          color: mainColor,
          width: 20,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CustomText(
            title: text,
          ),
        )
      ],
    );
  }
}
