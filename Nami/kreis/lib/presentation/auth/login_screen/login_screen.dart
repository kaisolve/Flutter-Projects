import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentation/auth/provider/auth_provider.dart';
import 'package:kreis/presentation/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentation/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentation/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentation/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentation/widgets/custom_text_form/custom_text_form.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(
        showToolBar: true,
      ),
      body: SizedBox(
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
                fontWeight: FontWeight.bold,
              )),
        ]),
      ),
    );
  }
}
