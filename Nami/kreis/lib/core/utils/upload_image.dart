import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kreis/presentation/auth/provider/auth_provider.dart';
import 'package:kreis/presentation/widgets/dialogs/scaffold_messanger.dart';
import 'package:provider/provider.dart';

Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    Provider.of<AuthProvider>(context, listen: false).image = image;
  } catch (e) {
    CustomScaffoldMessanger.showScaffoledMessanger(title: e.toString());
  }
  return image;
}
