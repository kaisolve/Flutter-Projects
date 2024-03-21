// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:gymat/core/app_colors/app_colors.dart';
// import 'package:gymat/core/constants/constants.dart';

// import '../../../core/dimens/dimens.dart';
// import '../../widgets/custom_text/custom_text.dart';

// class ButtonStart extends StatelessWidget {
//   final VoidCallback onTap;
//   const ButtonStart({super.key,required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         width: Dimens.width,
//         height: 56.0,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             gradient: const LinearGradient(colors: [startColor,mainColor],begin: Alignment.centerRight,end: Alignment.centerLeft)
//         ),
//         child: CustomText(
//           title: 'Build My Plan!'.tr().toUpperCase(),
//           fontSize: fontR17,
//           fontColor: white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
