import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/main.dart';
import 'package:kreis/presentations/auth/login_screen/login_screen.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/about.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/contact.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/edit_profile.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/favorite.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/myorders.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/profile_screens/points.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/widgets/text_buttons.dart';
import 'package:kreis/presentations/home_screen/main_app_layout/main_app_layout.dart';
import 'package:kreis/presentations/home_screen/provider/layout_provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_loader_overlay/loader_overlay.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  String token = Preferences().getUserData().userToken!;
  ProfileProvider profileProvider = getIt();
  @override
  void initState() {
    super.initState();
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
                      provider.getUser();
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
                                  GestureDetector(
                                    onTap: () async {
                                      await LoadingOverlay.of(context).during(
                                          Future.delayed(
                                              const Duration(seconds: 1)));
                                      NavigatorHandler.push(
                                          const MyOrdersScreen());
                                    },
                                    child: const CustomSvgIcon(
                                      assetName: 'order',
                                      width: 48,
                                      height: 48,
                                    ),
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
                                  GestureDetector(
                                    onTap: () => NavigatorHandler.push(
                                        const PointsScreen()),
                                    child: const CustomSvgIcon(
                                      assetName: 'points',
                                      width: 48,
                                      height: 48,
                                    ),
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
                          color: bottomNavigationColor,
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
                              onPressed: () => language()),
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
                              onPressed: () {
                                launchUrls('https://flutter.dev');
                              }
                              // Uri(
                              //   scheme: 'https',
                              //   host: 'play.google.com',
                              //   path:
                              //       "store/apps/details?id=com.example.kreis",
                              // ),
                              // mode: LaunchMode.externalApplication),
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
                    border: Border.all(color: const Color(0xff707070)),
                    title: 'Logout'.tr(),
                    onTap: () async {
                      profileProvider.logoutUser(token);
                      Provider.of<LayoutProvider>(context, listen: false)
                          .selectedindex = 0;
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

void language() {
  showModalBottomSheet(
    context: navigatorKey.currentContext!,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final localeProvider = EasyLocalization.of(context);

      return Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 16, 24),
        child: Consumer<ProfileProvider>(
          builder: (context, lang, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: 'Language'.tr(),
                      style: AppTextStyles()
                          .normalText(fontSize: fontR18)
                          .textColorBold(black),
                    ),
                    GestureDetector(
                      onTap: () => NavigatorHandler.pop(),
                      child: const CustomSvgIcon(
                        assetName: 'close',
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: mainColor,
                      value: 0,
                      groupValue: lang.selectedLanguage,
                      onChanged: (value) {
                        lang.changeLang(value!);
                      },
                    ),
                    CustomText(title: 'English'.tr()),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: mainColor,
                      value: 1,
                      groupValue: lang.selectedLanguage,
                      onChanged: (value) {
                        lang.changeLang(value!);
                      },
                    ),
                    CustomText(title: 'Arabic'.tr()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: CustomButton(
                      title: 'Confirm'.tr(),
                      onTap: () {
                        NavigatorHandler.pushReplacement(const MainAppLayout());
                        lang.selectedLanguage == 1
                            ? localeProvider!.setLocale(const Locale('ar'))
                            : localeProvider!.setLocale(const Locale('en'));
                      }),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

Future<void> launchUrls(String urlString) async {
  if (await canLaunchUrl(Uri.parse(urlString))) {
    await launchUrl(Uri.parse(urlString), mode: LaunchMode.inAppBrowserView);
  } else {
    throw 'Could not launch $urlString';
  }
}
