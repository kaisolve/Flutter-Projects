import 'dart:convert';

import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/data/models/user_model.dart';
import 'package:kreis/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  bool isDarkMode() {
    SharedPreferences sharedPreferences = getIt();
    bool? isDarkMode = sharedPreferences.getBool('isDarkMode');
    return isDarkMode ?? false;
  }

  void saveIsDarkMode(bool isDarkMode) async {
    SharedPreferences sharedPreferences = getIt();
    await sharedPreferences.setBool('isDarkMode', isDarkMode);
  }

  Future saveUserDataToSP(Object? userData) async {
    SharedPreferences sharedPreferences = getIt();
    await sharedPreferences.setString(userKey, jsonEncode(userData));
  }

  Future<UserModel?> getUserDataFromSP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userDataJson = sharedPreferences.getString(userKey);
    if (userDataJson != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
      return UserModel.fromJson(userDataMap);
    }
    return null;
  }
}
