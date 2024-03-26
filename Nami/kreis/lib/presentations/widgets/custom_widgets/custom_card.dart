import 'package:flutter/material.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String image;

  const CustomCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
