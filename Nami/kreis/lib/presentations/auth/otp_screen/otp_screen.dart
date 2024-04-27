import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/auth/provider/auth_provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentations/widgets/custom_loader_overlay/loader_overlay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../widgets/custom_button/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthProvider otpProvider = getIt();

  @override
  void initState() {
    super.initState();
    otpProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        showToolBar: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
                width: 225,
                height: 150,
                child: CustomAssetImage(assetName: 'otp')),
            const SizedBox(
              height: 12,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RichText(
                    text: TextSpan(
                        text: 'Please Enter SMS Code Sent To '.tr(),
                        style: AppTextStyles()
                            .normalText()
                            .textColorNormal(greyColor),
                        children: [
                      TextSpan(
                          text:
                              '(****${otpProvider.phone.substring(otpProvider.phone.length - 3)})',
                          style: AppTextStyles()
                              .normalText()
                              .textColorNormal(mainColor)),
                    ]))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: PinCodeTextField(
                  enableActiveFill: true,
                  mainAxisAlignment: MainAxisAlignment.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  appContext: context,
                  length: 6,
                  cursorColor: mainColor,
                  controller: otpProvider.smsController,
                  autoDisposeControllers: false,
                  pinTheme: PinTheme(
                      borderRadius: BorderRadius.circular(12),
                      fieldOuterPadding:
                          const EdgeInsets.symmetric(horizontal: 4),
                      fieldHeight: 57,
                      fieldWidth: 49.2,
                      activeColor: inputBg,
                      activeFillColor: inputBg,
                      selectedFillColor: inputBg,
                      selectedColor: greyColor,
                      inactiveColor: inputBg,
                      inactiveFillColor: inputBg,
                      shape: PinCodeFieldShape.box),
                )),
            const SizedBox(
              height: 32,
            ),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //     child: Center(child: Consumer<AuthProvider>(
            //       builder: (context, provider, _) {
            //         return CustomText(
            //           title: provider.isTimerStoped == null
            //               ? ''
            //               : provider.isTimerStoped!
            //                   ? 'Resend code'.tr()
            //                   : '${provider.timer}',t
            //           fontColor: mainColor,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 16,
            //         );
            //       },
            //     ))),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                title: 'Confirm'.tr(),
                onTap: () async {
                  otpProvider.checkSmsCode();
                  await LoadingOverlay.of(context)
                      .during(Future.delayed(const Duration(seconds: 1)));
                },
                fontSize: fontR16,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
          // ),
        ),
      ),
    );
  }
}
