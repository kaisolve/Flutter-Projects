import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kreis/core/text_styles/text_styles.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentation/auth/provider/auth_provider.dart';
import 'package:kreis/presentation/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentation/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../widgets/custom_button/custom_button.dart';
import '../../widgets/custom_text/custom_text.dart';

class OtpScreen extends StatefulWidget {
  final String phone;

  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthProvider provider = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.initOtp(widget.phone);
      provider.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        showToolBar: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                  width: 225,
                  height: 150,
                  child: CustomAssetImage(assetName: 'otp'))),
          const SizedBox(
            height: 12,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                  text: TextSpan(
                      text: 'We send a code to ( '.tr(),
                      style: AppTextStyles()
                          .normalText()
                          .textColorNormal(greyColor),
                      children: [
                    TextSpan(
                        text:
                            '****${widget.phone.substring(widget.phone.length - 3)}',
                        style: AppTextStyles()
                            .normalText()
                            .textColorNormal(mainColor)),
                    TextSpan(
                        text: ' ). Enter it here to verify your identity'.tr(),
                        style: AppTextStyles()
                            .normalText()
                            .textColorNormal(greyColor)),
                  ]))),
          const SizedBox(
            height: 32,
          ),
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
                controller: provider.smsController,
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(child: Consumer<AuthProvider>(
                builder: (context, provider, _) {
                  return CustomText(
                    title: provider.isTimerStoped == null
                        ? ''
                        : provider.isTimerStoped!
                            ? 'Resend code'.tr()
                            : '${provider.timer}',
                    fontColor: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  );
                },
              ))),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                title: 'Agree and confirm'.tr(),
                onTap: () {
                  provider.checkSmsCode();
                },
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
