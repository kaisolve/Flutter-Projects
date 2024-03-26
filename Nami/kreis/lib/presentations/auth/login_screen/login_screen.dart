import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/main.dart';
import 'package:kreis/presentations/auth/provider/auth_provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthProvider loginProvider = getIt();

  @override
  void initState() {
    super.initState();
    loginProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        showToolBar: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 375,
          height: 493,
          child: Column(children: [
            const CustomAssetImage(
              assetName: 'circle',
              width: 134.73,
              height: 120,
            ),
            const SizedBox(
              height: 84,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(
                title: 'Hi There !'.tr(),
                fontWeight: FontWeight.bold,
                fontColor: greyColor,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(
                title: 'Welcome back, Sign in and order now'.tr(),
                fontColor: greyColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextFormField(
                controller: loginProvider.phoneController,
                textInputType: TextInputType.phone,
                hint: 'Phone number'.tr(),
                prefix: const CustomText(
                  title: '+20',
                  fontColor: mainColor,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  title: 'Login'.tr(),
                  onTap: () {
                    loginProvider.checkPhoneNumber();
                  },
                  fontSize: 16,
                )),
          ]),
        ),
      ),
    );
  }
}

void otp() {
  AuthProvider loginProvider =
      Provider.of<AuthProvider>(navigatorKey.currentContext!, listen: false);
  showModalBottomSheet(
    // ignore: use_build_context_synchronously
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return SizedBox(
        width: 375,
        height: 491,
        child: Column(
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
                              '(****${loginProvider.phone!.substring(loginProvider.phone!.length - 3)})',
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
                  controller: loginProvider.smsController,
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
            //                   : '${provider.timer}',
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  title: 'Confirm'.tr(),
                  onTap: () {
                    Navigator.of(context).pop();

                    loginProvider.checkSmsCode();
                  },
                  fontSize: fontR16,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      );
    },
  );
}
