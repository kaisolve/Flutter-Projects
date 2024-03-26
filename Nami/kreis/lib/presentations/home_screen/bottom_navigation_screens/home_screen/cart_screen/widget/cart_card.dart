import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  String image;
  String text;
  String price;
  int amount;
  int id;
  void Function() onIncrease;
  void Function() onDecrease;
  void Function() onDelete;
  CartCard(
      {super.key,
      required this.image,
      required this.price,
      required this.text,
      required this.amount,
      required this.id,
      required this.onIncrease,
      required this.onDecrease,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 147.67,
      padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
      color: input2Bg,
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
                    Text('${text.split(' ')[0]} ${text.split(' ')[1]}'),
                  ],
                ),
                SizedBox(
                    width: 40,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: onDelete,
                        child: const CustomSvgIcon(assetName: 'can'),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BasketRoundIcons(image: 'minus', ontap: onDecrease),
                Container(
                  width: 124,
                  height: 48,
                  padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: containerBorder),
                  child: Center(
                    child: Text(Provider.of<CartProvider>(context)
                        .getItemAmount(id)
                        .toString()),
                  ),
                ),
                BasketRoundIcons(image: 'add', ontap: onIncrease),
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
              borderRadius: BorderRadius.circular(16), color: containerBorder),
          child: CustomSvgIcon(
            assetName: image,
          )),
    );
  }
}
