import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/utils/upload_image.dart';
import 'package:kreis/data/models/cities_model.dart';
import 'package:kreis/data/repositories/cities_repositories.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentation/auth/provider/auth_provider.dart';
import 'package:kreis/presentation/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentation/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:kreis/presentation/widgets/custom_button/custom_button.dart';
import 'package:kreis/presentation/widgets/custom_text_form/custom_text_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  AuthProvider registerProvider = getIt();
  List<DropdownMenuItem<CitiesModel>> dropdownItems = [];

  var selectedValue;

  void getDropdownItems() async {
    dropdownItems = await CitiesRepositories().getLocations();
  }

  @override
  void initState() {
    super.initState();
    registerProvider.init();
    getDropdownItems();
  }

  void selectImage() async {
    registerProvider.image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DropdownMenuItem<CitiesModel>>>(
        future: CitiesRepositories().getLocations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while waiting for data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Scaffold(
              appBar: const CustomAppBar(
                showBackArrow: true,
                showToolBar: true,
              ),
              body: Column(children: [
                const SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () => selectImage(),
                  child: registerProvider.image != null
                      ? Container(
                          width: 124,
                          height: 124,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(registerProvider.image!)),
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
                const SizedBox(
                  height: 30,
                ),
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
                const SizedBox(
                  height: 40,
                ),
                DropdownButtonFormField<CitiesModel>(
                  items: snapshot.data!,
                  onChanged: (CitiesModel? selectedCity) {
                    // Handle selected city
                    print('Selected city: ${selectedCity!.title}');
                  },
                  hint: Text('Select a city'),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomButton(
                      title: 'Register'.tr(),
                      onTap: () {
                        registerProvider.storeData();
                      },
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
            );
          }
        });
  }
}
