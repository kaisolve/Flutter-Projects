import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/auth/login_screen/login_screen.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/about.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/contact.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/edit_profile.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/favorite.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/language.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/widgets/text_buttons.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  ProfileProvider profileProvider = getIt();
  String token = Preferences().getUserData().userToken!;

  @override
  void initState() {
    super.initState();
    profileProvider.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Profile'.tr(), showBackArrow: true),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 375,
              height: 750,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 343,
                    height: 140,
                    child: Consumer<ProfileProvider>(
                        builder: (context, provider, _) {
                      // provider.getUser();
                      return Column(
                        children: [
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(provider.user.image!),
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(width: 1.46),
                            ),
                          ),
                          CustomText(
                              title:
                                  '${provider.user.fname} ${provider.user.lname}'),
                        ],
                      );
                    }),
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
                                  CustomText(title: 'My Orders'.tr())
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                NavigatorHandler.push(const FavoriteScreen()),
                            child: SizedBox(
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
                                    CustomText(title: 'Favorites'.tr())
                                  ],
                                ),
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
                                  CustomText(title: 'Points'.tr())
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
                    height: 328,
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
                            onPressed: () => NavigatorHandler.push(
                                const EditAccountScreen()),
                          ),
                          CustomTextButton(
                            arrow: true,
                            icon: 'language',
                            text: 'Language'.tr(),
                            onPressed: () =>
                                NavigatorHandler.push(LanguagePage()),
                          ),
                          CustomTextButton(
                            arrow: true,
                            icon: 'contact_us',
                            text: 'Contact With Us'.tr(),
                            onPressed: () =>
                                NavigatorHandler.push(const ContactPage()),
                          ),
                          CustomTextButton(
                            arrow: true,
                            icon: 'about',
                            text: 'About App'.tr(),
                            onPressed: () =>
                                NavigatorHandler.push(const AboutUs()),
                          ),
                          CustomTextButton(
                            arrow: true,
                            icon: 'rate',
                            text: 'Rate App'.tr(),
                            onPressed: () {},
                          ),
                          CustomTextButton(
                            arrow: false,
                            icon: 'delete',
                            text: 'Delete Account'.tr(),
                            onPressed: () {
                              profileProvider.deleteUser(token);
                              NavigatorHandler.pushAndRemoveUntil(
                                  const LoginScreen());
                            },
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
                    onTap: () {
                      profileProvider.logoutUser(token);
                      NavigatorHandler.pushAndRemoveUntil(const LoginScreen());
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
