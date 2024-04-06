import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/presentations/widgets/custom_rich_text/rich_text.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class ItemsCard extends StatelessWidget {
  String image;
  String title;
  num price;
  void Function() ontap;
  bool isFavorite;
  ItemsCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.ontap,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 167.5,
      height: 191.33,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  width: 135.5,
                  height: 90.33,
                  child: Image.network(image),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                      onTap: ontap,
                      child: CustomSvgIcon(
                        assetName: 'heart',
                        color: isFavorite ? mainColor : heartColor,
                      )),
                ),
              ],
            ),
            Align(
              child: SizedBox(
                width: 151.5,
                height: 21,
                child: CustomText(title: title),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: CustomRichText(children: [
                      TextSpan(
                          text: '$price ',
                          style: AppTextStyles()
                              .normalText()
                              .textColorBold(black)),
                      TextSpan(
                          text: 'Coin'.tr(),
                          style: AppTextStyles()
                              .normalText()
                              .textColorNormal(black)),
                    ])),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: CustomSvgIcon(
                    assetName: 'mincart',
                    width: 32,
                    height: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
