import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreis/presentation/items_page/single_item.dart/single_item.dart';

// ignore: must_be_immutable
class BasketCard extends StatelessWidget {
  String image;
  String text;
  String price;
  int weight;
  BasketCard(
      {super.key,
      required this.image,
      required this.price,
      required this.text,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 147.67,
      padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
      color: const Color(0x0feeeeee),
      child: SizedBox(
        width: 343,
        height: 66.67,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 100, height: 66.67, child: Image.network(image)),
                    Text(text),
                  ],
                ),
                SizedBox(
                    width: 40,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset('assets/images/svgs/trash.svg'),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // BasketRoundIcons(
                //     image: 'assets/images/svgs/minus.svg',
                //     ontap: () =>
                //         Provider.of<ItemsProvider>(context, listen: false)
                //             .updateNum(1)),
                // Container(
                //   width: 124,
                //   height: 48,
                //   padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(16),
                //       color: const Color(0xffeeeeee)),
                //   child: Center(
                //       child: Text(Provider.of<ItemsProvider>(
                //     context,
                //   ).n.toString())),
                // ),
                // BasketRoundIcons(
                //   image: 'assets/images/svgs/add.svg',
                //   ontap: () =>
                //       Provider.of<ItemsProvider>(context, listen: false)
                //           .updateNum(0),
                // ),
                AddMinusItems(text: weight),
                Text(price),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BasketRoundIcons extends StatelessWidget {
  String image;
  void Function() ontap;
  BasketRoundIcons({super.key, required this.image, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffEEEEEE)),
          child: SvgPicture.asset(image)),
    );
  }
}
