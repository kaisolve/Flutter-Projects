import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  String text;
  String subtext;
  String image;
  bool arrow;
  void Function()? ontap;
  CustomListTile(
      {super.key,
      required this.text,
      required this.subtext,
      required this.image,
      required this.arrow,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 343,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: arrow
              ? Border.all(
                  width: 1,
                  color: containerBorder,
                )
              : null,
          color: input2Bg,
        ),
        child: ListTile(
          leading: SvgPicture.asset(image),
          title: CustomText(title: text),
          subtitle: CustomText(title: subtext),
          trailing: arrow ? const Icon(Icons.arrow_forward_ios_rounded) : null,
        ),
      ),
    );
  }
}
