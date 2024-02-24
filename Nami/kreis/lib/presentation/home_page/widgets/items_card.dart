import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ItemsCard extends StatelessWidget {
  String image;
  String title;
  ItemsCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          width: 167.5,
          height: 191.33,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.circle_outlined),
                    ),
                    Image.network(image),
                    // Image.asset(
                    //   alignment: Alignment.center,
                    //   image,
                    // ),
                  ],
                ),
                Align(child: Text(title)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text("\$360"), Icon(Icons.circle)],
                ),
                // Align(alignmen/t: Alignment.bottomCenter, child: ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
