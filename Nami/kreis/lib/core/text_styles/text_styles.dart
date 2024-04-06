import 'package:flutter/material.dart';
import '../constants/constants.dart';

class AppTextStyles {
  TextStyle normalText({double fontSize = fontR14}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'MadaniArabic-Regular',
      // EasyLocalization.of(navigatorKey.currentContext!)!.currentLocale ==
      //         const Locale('ar')
      //     ? 'MadaniArabic-Regular'
      //     : 'font_regular',
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle textColorNormal(Color color) =>
      copyWith(color: color, fontFamily: 'MadaniArabic-Regular');
  TextStyle textColorBold(Color color) => copyWith(
      color: color,
      fontFamily: 'MadaniArabic-SemiBold',
      fontWeight: FontWeight.w400);
}
