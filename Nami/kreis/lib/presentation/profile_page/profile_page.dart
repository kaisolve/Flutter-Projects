// import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreis/presentation/profile_page/profile_pages/about.dart';
import 'package:kreis/presentation/profile_page/profile_pages/contact.dart';
import 'package:kreis/presentation/profile_page/profile_pages/language.dart';
import 'package:kreis/presentation/profile_page/widgets/text_buttons.dart';
import 'package:kreis/widgets/custom_app_bar/app_bar.dart';
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
        appBar: CustomAppbar(page: 'settings'.tr(), arrow: false),
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
                      SvgPicture.asset('assets/images/svgs/image.svg'),
                      const Text('name'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xfff6f6f6),
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
                                SvgPicture.asset(
                                    'assets/images/svgs/order.svg'),
                                Text('orders'.tr())
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
                                SvgPicture.asset('assets/images/svgs/like.svg'),
                                Text('like'.tr())
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
                                SvgPicture.asset(
                                    'assets/images/svgs/points.svg'),
                                Text('points'.tr())
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
                  height: 374,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        CustomTextButton(
                          arrow: true,
                          icon: 'assets/images/svgs/edit_account.svg',
                          text: 'edit_account'.tr(),
                          onPressed: () {},
                        ),
                        CustomTextButton(
                          arrow: true,
                          icon: 'assets/images/svgs/language.svg',
                          text: 'language'.tr(),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LanguagePage())),
                        ),
                        CustomTextButton(
                            arrow: true,
                            icon: 'assets/images/svgs/contact_us.svg',
                            text: 'contact_us'.tr(),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ContactPage()))),
                        CustomTextButton(
                          arrow: true,
                          icon: 'assets/images/svgs/about.svg',
                          text: 'about'.tr(),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutUs())),
                        ),
                        CustomTextButton(
                          arrow: true,
                          icon: 'assets/images/svgs/rate.svg',
                          text: 'rate'.tr(),
                          onPressed: () {},
                        ),
                        CustomTextButton(
                          arrow: false,
                          icon: 'assets/images/svgs/delete.svg',
                          text: 'delete_account'.tr(),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
