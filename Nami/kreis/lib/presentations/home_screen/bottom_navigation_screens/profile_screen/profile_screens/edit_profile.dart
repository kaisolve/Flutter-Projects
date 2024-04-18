import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/core/utils/upload_image.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/main_app_layout/main_app_layout.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_loader_overlay/loader_overlay.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';
import 'package:provider/provider.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  Preferences preferences = Preferences();
  ProfileProvider profileProvider = getIt();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  File? image;

  void selectImage() async {
    image = await pickImage(context);
  }

  @override
  void initState() {
    super.initState();

    ///  for solving setState() or markNeedsBuild() called during build.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileProvider.getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Account'.tr(),
        showBackArrow: true,
      ),
      body: Consumer<ProfileProvider>(builder: (context, provider, _) {
        return Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  InkWell(
                      onTap: () => selectImage(),
                      child: image == null
                          ? Container(
                              width: 124,
                              height: 124,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(provider.user.image!)),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(width: 1.46),
                              ),
                            )
                          : Container(
                              width: 124,
                              height: 124,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill, image: FileImage(image!)),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(width: 1.46),
                              ),
                            )),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: SizedBox(
                          width: 167.5,
                          height: 60,
                          child: CustomTextFormField(
                            controller: firstName,
                            textInputType: TextInputType.name,
                            hint: provider.user.fname,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: SizedBox(
                          width: 167.5,
                          height: 60,
                          child: CustomTextFormField(
                            controller: lastName,
                            textInputType: TextInputType.name,
                            hint: provider.user.lname,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: CustomButton(
                  title: 'Confirm'.tr(),
                  onTap: () async {
                    await LoadingOverlay.of(context).during(
                        profileProvider.updateProfile(
                            firstName.text.trim(),
                            lastName.text.trim(),
                            image?.path,
                            preferences.getUserData().userToken!));
                    profileProvider.getUser();
                    NavigatorHandler.pushReplacement(const MainAppLayout());
                  },
                  fontSize: 16,
                )),
          ],
        );
      }),
    );
  }
}
