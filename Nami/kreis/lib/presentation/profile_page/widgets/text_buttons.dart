import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

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
            SvgPicture.asset(
              icon,
            ),
            Text(
              text,
              style: TextStyle(
                  color: arrow ? Colors.black : const Color(0xffff0005)),
            )
          ],
        ),
        Visibility(
            visible: arrow,
            child: const Icon(Icons.arrow_forward_ios_outlined)),
      ]),
    );
  }
}
