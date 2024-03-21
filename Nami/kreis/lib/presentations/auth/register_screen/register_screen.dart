import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/utils/upload_image.dart';
import 'package:kreis/data/repositories/cities_repositories.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/auth/provider/auth_provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentations/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  AuthProvider registerProvider = getIt();

  CitiesRepositories citiesRepositories = CitiesRepositories();

  // @override
  // void initState() {
  //   super.initState();
  //   // registerProvider.init();
  // }

  void selectImage() async {
    // ignore: unused_local_variable
    File? image = await pickImage(context);

    setState(() {});
  }

  bool checkedValue = false;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    registerProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        showToolBar: true,
        title: 'Create Account'.tr(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Gap(20.5),
          InkWell(
            onTap: () => selectImage(),
            child: registerProvider.image != null
                ? Container(
                    width: 124,
                    height: 124,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: FileImage(registerProvider.image! as File)),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.46),
                    ),
                  )
                : const CustomAssetImage(
                    assetName: 'profile',
                    width: 134.73,
                    height: 120,
                  ),
          ),
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
                    controller: registerProvider.fNameController,
                    textInputType: TextInputType.name,
                    hint: 'first name'.tr(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: SizedBox(
                  width: 167.5,
                  height: 60,
                  child: CustomTextFormField(
                    controller: registerProvider.lNameController,
                    textInputType: TextInputType.name,
                    hint: 'last name'.tr(),
                  ),
                ),
              ),
            ],
          ),
          const Gap(8),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Container(
              width: 343,
              height: 61,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: containerBorder, width: 1)),
              child: ListTile(
                leading: const CustomSvgIcon(
                  assetName: 'city',
                  color: mainColor,
                ),
                title: Text(
                    Provider.of<AuthProvider>(context).city ?? 'City'.tr()),
                trailing: const SizedBox(
                  width: 8,
                  height: 4,
                  child: CustomSvgIcon(
                    assetName: 'down',
                    color: mainColor,
                  ),
                ),
                onTap: () {
                  showDropdown(context);
                },
              ),
            ),
          ),
          Column(
            children: [
              CheckboxListTile(
                title: Text("Invited By SomeOne?".tr()),
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                checkColor: white,
                activeColor: mainColor,
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (checkedValue)
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: CustomTextFormField(
                    controller: registerProvider.invitationCode,
                    textInputType: TextInputType.text,
                    hint: 'Write Code'.tr(),
                  ),
                ),
            ],
          ),
          const Gap(10),
        ]),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: CustomButton(
            title: 'Register'.tr(),
            onTap: () {
              registerProvider.register();
            },
            fontSize: 16,
          )),
    );
  }

  void showDropdown(BuildContext context) async {
    final cityNames = await CitiesRepositories().getLocations();
    List<String> dropdownItems =
        cityNames.map((city) => city.title ?? "").toList();
    List<int> citiesId = cityNames.map((city) => city.id ?? 2).toList();

    showModalBottomSheet(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemCount: dropdownItems.length,
              itemBuilder: (BuildContext context, int index) {
                final city = dropdownItems[index];
                final cityId = citiesId[index];
                return ListTile(
                  title: Text(city),
                  onTap: () {
                    Navigator.of(context).pop();
                    Provider.of<AuthProvider>(context, listen: false)
                        .setCity(city);
                    Provider.of<AuthProvider>(context, listen: false)
                        .setCityId(cityId);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
