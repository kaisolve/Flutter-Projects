import 'package:flutter/material.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class ItemsCard extends StatelessWidget {
  String image;
  String title;
  num price;
  ItemsCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

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
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                    width: 135.5, height: 90.33, child: Image.network(image)),
                const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 4, 5, 4),
                    child: CustomSvgIcon(assetName: 'heart'),
                  ),
                ),
              ],
            ),
            Align(
                child: SizedBox(
                    width: 151.5, height: 21, child: CustomText(title: title))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 111.5,
                    height: 24,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: CustomText(title: price.toString()),
                    )),
                const SizedBox(
                  width: 32,
                  height: 32,
                  child: CustomSvgIcon(assetName: 'trash'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
