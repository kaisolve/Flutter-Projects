// import 'package:flutter/material.dart';
// import 'package:gymat/core/app_colors/app_colors.dart';

// import '../../../core/constants/constants.dart';
// import '../../../core/dimens/dimens.dart';
// import '../custom_text/custom_text.dart';

// class CustomButton extends StatelessWidget {
//   final String title;
//   final double fontSize;
//   final Color fontColor;
//   final FontWeight? fontWeight;

//   final Color bg;
//   final VoidCallback onTap;
//   final double? width;

//   const CustomButton(
//       {super.key,
//       required this.title,
//       this.fontSize = fontR14,
//       this.fontWeight = FontWeight.normal,
//       this.fontColor = white,
//       this.bg = mainColor,
//       required this.onTap,
//       this.width});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         width: width ?? Dimens.width,
//         height: 56.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: bg,
//         ),
//         child: CustomText(
//           title: title,
//           fontSize: fontSize,
//           fontColor: fontColor,
//           fontWeight: fontWeight??FontWeight.normal,
//         ),
//       ),
//     );
//   }
// }
