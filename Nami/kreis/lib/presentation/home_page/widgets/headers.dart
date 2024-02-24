import 'package:flutter/material.dart';
import 'package:kreis/core/app_style.dart';

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
          child: Text(
            text1,
            style: textstyles(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Row(
          children: [
            TextButton(
                onPressed: onPressed,
                child: Text(
                  text2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xffDF1C26)),
                )),
          ],
        )
      ],
    );
  }
}
