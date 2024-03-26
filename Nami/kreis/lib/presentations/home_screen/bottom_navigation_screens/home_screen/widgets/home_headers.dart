import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class HomeHeaders extends StatelessWidget {
  final String text1, text2;
  void Function()? onPressed;

  HomeHeaders(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            title: text1,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: onPressed,
              child: CustomText(
                title: text2,
                fontColor: mainColor,
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}
