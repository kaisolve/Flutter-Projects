import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const CustomAssetImage(
      {super.key,
      required this.assetName,
      this.width = 20,
      this.height = 20,
      this.boxFit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        'assets/images/pngs/$assetName.png',
        width: width,
        height: height,
        fit: boxFit,
      ),
    );
  }
}
