// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:kreis/widgets/custom_app_bar/custom_app_bar.dart';
// import 'package:gymat/presentations/widgets/custom_app_bar/custom_app_bar.dart';

// import '../../../../core/app_colors/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      // CustomAppBar(
      //   showToolBar: true,
      //   title: 'Profile'.tr(),
      //   elevation: 5,
      //   // bgColor: inputBgDark,
      // ),
      body: const Center(
        child: Text('profile', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
