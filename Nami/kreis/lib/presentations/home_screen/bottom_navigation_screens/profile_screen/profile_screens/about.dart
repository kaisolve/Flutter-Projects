import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).aboutUS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'About App'.tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: SizedBox(
            width: 375,
            height: 400,
            child: Consumer<ProfileProvider>(builder: (context, provider, _) {
              if (provider.isloading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                );
              } else if (provider.failedtoload) {
                return const CustomText(
                    title: 'Error: Failed to load settings');
              } else {
                return Center(
                  child: Column(
                    children: [
                      const CustomAssetImage(
                        assetName: 'circle',
                        width: 134,
                        height: 120,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
                            child: CustomSvgIcon(
                              assetName: 'us',
                              width: 13,
                              height: 33,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CustomText(
                              title: 'Who Are We?'.tr(),
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        title: provider.about,
                      )
                    ],
                  ),
                );
              }
            }),
          ),
        ));
  }
}
