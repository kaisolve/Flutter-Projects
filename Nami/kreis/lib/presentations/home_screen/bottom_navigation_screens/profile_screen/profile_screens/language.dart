// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:kreis/core/navigator/navigator.dart';
// import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
// import 'package:kreis/presentations/home_screen/main_app_layout/main_app_layout.dart';
// import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
// import 'package:provider/provider.dart';

// // ignore: library_private_types_in_public_api
// GlobalKey<_LanguagePageState> languagePageKey = GlobalKey<_LanguagePageState>();

// class LanguagePage extends StatefulWidget {
//   LanguagePage({Key? key}) : super(key: languagePageKey);

//   @override
//   State<LanguagePage> createState() => _LanguagePageState();
// }

// class _LanguagePageState extends State<LanguagePage> {
//   @override
//   Widget build(BuildContext context) {
//     final localeProvider = EasyLocalization.of(context);

//     return Scaffold(
//       appBar: CustomAppBar(title: 'Language'.tr(), showBackArrow: true),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SizedBox(
//           width: 375,
//           height: 242,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Row(
//                 children: [
//                   Consumer<ProfileProvider>(
//                     builder: (context, lang, child) {
//                       return Radio(
//                         value: 0,
//                         groupValue: lang.selectedLanguage,
//                         onChanged: (value) {
//                           lang.changeLang(value!);
//                           localeProvider!.setLocale(const Locale('en'));
//                           NavigatorHandler.pushReplacement(
//                               const MainAppLayout());
//                         },
//                       );
//                     },
//                   ),
//                   Text('english'.tr()),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Consumer<ProfileProvider>(builder: (context, lang, child) {
//                     return Radio(
//                       value: 1,
//                       groupValue: lang.selectedLanguage,
//                       onChanged: (value) {
//                         lang.changeLang(value!);
//                         localeProvider!.setLocale(const Locale('ar'));
//                         NavigatorHandler.pushReplacement(const MainAppLayout());
//                       },
//                     );
//                   }),
//                   Text('arabic'.tr()),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
