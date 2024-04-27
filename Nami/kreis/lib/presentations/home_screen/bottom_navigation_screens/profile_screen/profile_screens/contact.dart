import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_loader_overlay/loader_overlay.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ProfileProvider profileProvider = ProfileProvider();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Contact US'.tr(), showBackArrow: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: SizedBox(
                width: 196.42,
                height: 150,
                child: Image.asset('assets/images/pngs/contactus.png')),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: CustomTextFormField(
              controller: nameController,
              hint: 'Name'.tr(),
              prefix: const CustomSvgIcon(assetName: 'person'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: CustomTextFormField(
              controller: emailController,
              hint: 'Email'.tr(),
              prefix: const CustomSvgIcon(assetName: 'at'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: CustomTextFormField(
              controller: subjectController,
              hint: 'Subject'.tr(),
              prefix: const CustomSvgIcon(assetName: 'mark'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: CustomTextFormField(
              controller: messageController,
              hint: 'Message'.tr(),
              prefix: const CustomSvgIcon(assetName: 'message'),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          //   child: CustomTextFormField(
          //     controller: phoneController,
          //     hint: 'Phone'.tr(),
          //     prefix: const CustomSvgIcon(assetName: 'at'),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: SizedBox(
                width: 341,
                height: 51,
                child: CustomButton(
                    title: 'Send'.tr(),
                    onTap: () async {
                      profileProvider.contactUs(
                          nameController.text,
                          subjectController.text,
                          messageController.text,
                          phoneController.text);
                      await LoadingOverlay.of(context)
                          .during(Future.delayed(const Duration(seconds: 1)));
                      NavigatorHandler.pop();
                    })),
          )
        ],
      ),
    );
  }
}
