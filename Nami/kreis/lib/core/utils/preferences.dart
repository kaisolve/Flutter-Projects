import 'dart:convert';

import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/data/models/user_model.dart';
import 'package:kreis/data/repositories/auth_repository.dart';
import 'package:kreis/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences sharedPreferences = getIt();
  String? token;
  bool isDarkMode() {
    return sharedPreferences.getBool('isDarkMode') ?? false;
  }

  void saveIsDarkMode(bool isDarkMode) async {
    await sharedPreferences.setBool('isDarkMode', isDarkMode);
  }

  void saveUserDataToSP(UserAuthResult user) {
    sharedPreferences.setString(userKey, jsonEncode(user.user));
    sharedPreferences.setString(tokenKey, user.userToken!);
    sharedPreferences.setBool(signInKey, user.success);
  }

  UserAuthResult? getUserData() {
    String? userDataJson = sharedPreferences.getString(userKey);
    String? userToken = sharedPreferences.getString(tokenKey);
    bool success = sharedPreferences.getBool(signInKey)!;
    if (userDataJson != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
      return UserAuthResult(
          user: UserModel.fromJson(userDataMap),
          userToken: userToken,
          success: success);
    }
    return null;
  }

  // Future<UserAuthResult?> getUserDataFromSP() async {
  //   String? userDataJson = sharedPreferences.getString(userKey);
  //   String? userToken = sharedPreferences.getString(tokenKey);
  //   if (userDataJson != null) {
  //     Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
  //     return UserAuthResult(
  //       user: UserModel.fromJson(userDataMap),
  //       userToken: userToken,
  //     );
  //   }
  //   return null;
  // }

  void clearUserData() async {
    await sharedPreferences.clear();
  }
}
