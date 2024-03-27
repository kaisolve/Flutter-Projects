import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/core/utils/upload_image.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/about.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/contact.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/edit_profile.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/language.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/widgets/text_buttons.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  void selectImage() async {
    // ignore: unused_local_variable
    File? image = await pickImage(context);
  }

  Preferences preferences = Preferences();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: preferences.getUserDataFromSP(),
      builder: (context, snapshot) {
        final user = snapshot.data!;

        return Scaffold(
            appBar: CustomAppBar(title: 'Profile'.tr(), showBackArrow: true),
            body: Center(
              child: SizedBox(
                width: 375,
                height: 750,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 343,
                      height: 140,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => selectImage(),
                            child: user.image != null
                                ? Container(
                                    width: 96,
                                    height: 96,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(user.image!),
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(width: 1.46),
                                    ),
                                  )
                                : const CustomAssetImage(
                                    assetName: 'profile',
                                    width: 134.73,
                                    height: 120,
                                  ),
                          ),
                          CustomText(title: '${user.fname} ${user.lname}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: bottomNavigationColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 103.67,
                              height: 97,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const CustomSvgIcon(
                                      assetName: 'order',
                                      width: 48,
                                      height: 48,
                                    ),
                                    Text('My Orders'.tr())
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 103.67,
                              height: 97,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const CustomSvgIcon(
                                      assetName: 'like',
                                      width: 48,
                                      height: 48,
                                    ),
                                    Text('Favorites'.tr())
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 103.67,
                              height: 97,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const CustomSvgIcon(
                                      assetName: 'points',
                                      width: 48,
                                      height: 48,
                                    ),
                                    Text('Points'.tr())
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 343,
                      height: 320,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            CustomTextButton(
                              arrow: true,
                              icon: 'edit_account',
                              text: 'Edit Account'.tr(),
                              onPressed: () => NavigatorHandler.pushReplacement(
                                  const EditAccountScreen()),
                            ),
                            CustomTextButton(
                              arrow: true,
                              icon: 'language',
                              text: 'Language'.tr(),
                              onPressed: () => NavigatorHandler.pushReplacement(
                                  LanguagePage()),
                            ),
                            CustomTextButton(
                              arrow: true,
                              icon: 'contact_us',
                              text: 'Contact With Us'.tr(),
                              onPressed: () => NavigatorHandler.pushReplacement(
                                  const ContactPage()),
                            ),
                            CustomTextButton(
                              arrow: true,
                              icon: 'about',
                              text: 'About'.tr(),
                              onPressed: () => NavigatorHandler.pushReplacement(
                                  const AboutUs()),
                            ),
                            CustomTextButton(
                              arrow: true,
                              icon: 'rate',
                              text: 'Rate'.tr(),
                              onPressed: () {},
                            ),
                            CustomTextButton(
                              arrow: false,
                              icon: 'delete',
                              text: 'Delete Account'.tr(),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      width: 167,
                      height: 48,
                      bg: white,
                      fontColor: const Color(0xff707070),
                      title: 'Logout'.tr(),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
