// import 'dart:io';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:kreis/presentation/auth/provider/auth_provider.dart';
// import 'package:kreis/presentation/home_screen/bottom_navigation_screens/profile_screen/profile_screens/about.dart';
// import 'package:kreis/presentation/home_screen/bottom_navigation_screens/profile_screen/profile_screens/contact.dart';
// import 'package:kreis/presentation/home_screen/bottom_navigation_screens/profile_screen/profile_screens/language.dart';
// import 'package:kreis/presentation/home_screen/bottom_navigation_screens/profile_screen/widgets/text_buttons.dart';
// import 'package:kreis/presentation/widgets/custom_app_bar/custom_app_bar.dart';
// import 'package:kreis/presentation/widgets/custom_asset_image/custom_asset_image.dart';
// import 'package:provider/provider.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Provider.of<AuthProvider>(context).getUserDataFromSP(),
//       builder: (context, snapshot) {
//         final user = snapshot.data;

//         return Scaffold(
//             appBar: CustomAppBar(title: 'settings'.tr(), showBackArrow: true),
//             body: Center(
//               child: SizedBox(
//                 width: 375,
//                 height: 750,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     SizedBox(
//                       width: 343,
//                       height: 140,
//                       child: Column(
//                         children: [
//                           user!.imagePic == null
//                               ? const CustomAssetImage(
//                                   width: 96, height: 96, assetName: 'profile')
//                               : Image(
//                                   image: FileImage(user.imagePic as File),
//                                 ),
//                           Text('${user.fname} ${user.lname}'),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: const Color(0xfff6f6f6),
//                             borderRadius: BorderRadius.circular(16)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(
//                               width: 103.67,
//                               height: 97,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     SvgPicture.asset(
//                                         'assets/images/svgs/order.svg'),
//                                     Text('orders'.tr())
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 103.67,
//                               height: 97,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     SvgPicture.asset(
//                                         'assets/images/svgs/like.svg'),
//                                     Text('like'.tr())
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 103.67,
//                               height: 97,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     SvgPicture.asset(
//                                         'assets/images/svgs/points.svg'),
//                                     Text('points'.tr())
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 343,
//                       height: 374,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: const Color(0xffF6F6F6),
//                             borderRadius: BorderRadius.circular(16)),
//                         child: Column(
//                           children: [
//                             CustomTextButton(
//                               arrow: true,
//                               icon: 'assets/images/svgs/edit_account.svg',
//                               text: 'edit_account'.tr(),
//                               onPressed: () {},
//                             ),
//                             CustomTextButton(
//                               arrow: true,
//                               icon: 'assets/images/svgs/language.svg',
//                               text: 'language'.tr(),
//                               onPressed: () => Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => LanguagePage())),
//                             ),
//                             CustomTextButton(
//                                 arrow: true,
//                                 icon: 'assets/images/svgs/contact_us.svg',
//                                 text: 'contact_us'.tr(),
//                                 onPressed: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const ContactPage()))),
//                             CustomTextButton(
//                               arrow: true,
//                               icon: 'assets/images/svgs/about.svg',
//                               text: 'about'.tr(),
//                               onPressed: () => Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const AboutUs())),
//                             ),
//                             CustomTextButton(
//                               arrow: true,
//                               icon: 'assets/images/svgs/rate.svg',
//                               text: 'rate'.tr(),
//                               onPressed: () {},
//                             ),
//                             CustomTextButton(
//                               arrow: false,
//                               icon: 'assets/images/svgs/delete.svg',
//                               text: 'delete_account'.tr(),
//                               onPressed: () {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//       },
//     );
//   }
// }
