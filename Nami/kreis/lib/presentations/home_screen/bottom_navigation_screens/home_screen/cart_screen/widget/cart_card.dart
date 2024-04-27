import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';

// ignore: must_be_immutable
class CartCard extends StatefulWidget {
  String image;
  String text;
  String price;
  int amount;
  int id;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;
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
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
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
                        width: 100,
                        height: 66.67,
                        child: Image.network(widget.image)),
                    Text(
                        '${widget.text.split(' ')[0]} ${widget.text.split(' ')[1]}'),
                  ],
                ),
                SizedBox(
                    width: 40,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: widget.onDelete,
                        child: const CustomSvgIcon(assetName: 'can'),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CartRoundIcons(image: 'minus', ontap: widget.onDecrease),
                Container(
                  width: 124,
                  height: 48,
                  padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: containerBorder),
                  child: Center(
                    child: Text(widget.amount.toString()),
                  ),
                ),
                CartRoundIcons(image: 'add', ontap: widget.onIncrease),
                Text(widget.price),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CartRoundIcons extends StatefulWidget {
  String image;
  void Function() ontap;
  CartRoundIcons({super.key, required this.image, required this.ontap});

  @override
  State<CartRoundIcons> createState() => _CartRoundIconsState();
}

class _CartRoundIconsState extends State<CartRoundIcons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: containerBorder),
          child: CustomSvgIcon(
            assetName: widget.image,
          )),
    );
  }
}
