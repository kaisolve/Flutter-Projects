import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/main.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';
import 'package:kreis/presentations/widgets/custom_tile/custom_tile.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  ProfileProvider profileProvider = getIt();
  @override
  void initState() {
    super.initState();
    profileProvider.getPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Points'.tr(),
      ),
      body: Consumer<ProfileProvider>(builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 375,
            height: 679,
            child: Column(
              children: [
                Stack(
                  children: [
                    const CustomAssetImage(
                      width: 240,
                      height: 240,
                      assetName: 'points',
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomSvgIcon(
                                  assetName: 'points',
                                  width: 32,
                                  height: 32,
                                ),
                                CustomText(
                                  title: 'Points'.tr(),
                                  style: AppTextStyles()
                                      .normalText(fontSize: fontR16)
                                      .textColorBold(greyColor),
                                ),
                              ],
                            ),
                          ),
                          CustomText(
                            title: provider.totalPoints.toString(),
                            style: AppTextStyles()
                                .normalText(fontSize: 60)
                                .textColorBold(black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  width: 203,
                  height: 53,
                  title: 'Invite Friend'.tr(),
                  onTap: () => inviteFriend(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                      width: 343,
                      height: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: pointsBorder, style: BorderStyle.solid)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                title: 'History'.tr(),
                                fontWeight: FontWeight.w400,
                                fontColor: greyColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 343,
                            height: 309,
                            child: Consumer<ProfileProvider>(
                                builder: (context, provider, _) {
                              return ListView.builder(
                                  itemCount: provider.pointsHistory.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                      child: CustomListTile(
                                        text: 'You Invited'.tr(),
                                        subtext: 'Add Friend Here',
                                        arrow: false,
                                        trailingIcon: 'point',
                                        icon: 'points',
                                      ),
                                    );
                                    //  Center(
                                    //   child: CustomText(
                                    //     fontColor: mainColor,
                                    //     title:
                                    //         'You Haven\'t Invited Any Friend'
                                    //             .tr(),
                                    //   ),
                                    // );
                                  });
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

void inviteFriend() {
  TextEditingController inviteController = TextEditingController();

  void copy() async {
    await FlutterClipboard.copy(inviteController.text);
    ScaffoldMessenger.of(navigatorKey.currentContext!)
        .showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        "📝 text Copied to clipboard",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 20),
    ));
  }

  showModalBottomSheet(
    context: navigatorKey.currentContext!,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: 'Invite Friend'.tr(),
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
            // generate qrcode
            QrImageView(
              data: inviteController.text,
              size: 280,
              embeddedImageStyle: const QrEmbeddedImageStyle(
                size: Size(
                  178.56,
                  183.31,
                ),
              ),
            ),
            CustomTextFormField(
              controller: inviteController,
              color: containerBorder,
              prefix: GestureDetector(
                  onTap: () => copy(),
                  child: const CustomSvgIcon(
                    assetName: 'copy',
                    width: 23,
                    height: 23,
                  )),
            ),
          ],
        ),
      );
    },
  );
}
