// import 'package:flutter/material.dart';

// class CustomText extends StatelessWidget {
//   final String? title;
//   final Color fontColor;
//   final double fontSize;
//   final FontWeight fontWeight;
//   final int? maxLines;
//   const CustomText(
//       {super.key,
//       this.title,
//       this.fontColor = Colors.black,
//       this.fontSize = fontR14,
//       this.fontWeight = FontWeight.normal,
//       this.maxLines});

//   @override
//   Widget build(BuildContext context) {
//     return fontWeight == FontWeight.normal
//         ? Text(
//             title ?? '',
//             maxLines: maxLines,
//             overflow: maxLines != null ? TextOverflow.ellipsis : null,
//             style: AppTextStyles()
//                 .normalText(fontSize: fontSize)
//                 .textColorNormal(fontColor),
//           )
//         : Text(
//             title ?? '',
//             style: AppTextStyles()
//                 .normalText(fontSize: fontSize)
//                 .textColorBold(fontColor),
//           );
//   }
// }
