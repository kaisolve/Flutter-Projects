import 'package:flutter/material.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/text_styles/text_styles.dart';

class CustomText extends StatelessWidget {
  final String? title;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextStyle? style;
  const CustomText({
    super.key,
    this.title,
    this.fontColor = Colors.black,
    this.fontSize = fontR14,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return fontWeight == FontWeight.normal
        ? Text(
            title ?? '',
            maxLines: maxLines,
            overflow: maxLines != null ? TextOverflow.ellipsis : null,
            style: style ??
                AppTextStyles()
                    .normalText(fontSize: fontSize)
                    .textColorNormal(fontColor),
          )
        : Text(
            title ?? '',
            style: AppTextStyles()
                .normalText(fontSize: fontSize)
                .textColorBold(fontColor),
          );
  }
}
