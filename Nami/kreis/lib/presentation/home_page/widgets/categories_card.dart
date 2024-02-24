import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  final String title;
  final String image;

  const CategoriesCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            )),
      ],
    );
  }
}
