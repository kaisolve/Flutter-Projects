import 'package:flutter/material.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';

// ignore: must_be_immutable
class IconContainer extends StatelessWidget {
  String image;
  void Function() ontap;
  IconContainer({super.key, required this.image, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(16),
                color: const Color(0xffeeeeee)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSvgIcon(assetName: image),
            )),
      ),
    );
  }
}
