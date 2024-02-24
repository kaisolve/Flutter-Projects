import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture getCustomIcon(String asset, bool isclicked) {
  return SvgPicture.asset(
    asset,

    // size: 24.0,
    color: isclicked ? const Color(0xffDF1C26) : Colors.grey,
  );
}

TextStyle textstyles({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
