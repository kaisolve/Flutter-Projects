import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String image;
  final Color color;

  const CustomCard(
      {super.key,
      required this.title,
      required this.image,
      this.color = white});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color,
          )),
      width: 82.75,
      height: 142,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            width: 80,
            height: 80,
            child: Card(
              child: Image.network(
                image,
              ),
            ),
          ),
          SizedBox(
              width: 66.75,
              height: 36,
              child: CustomText(
                title: title,
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}
