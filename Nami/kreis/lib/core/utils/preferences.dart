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

  Future<void> saveUserDataToSP(UserAuthResult user) async {
    await sharedPreferences.setString(userKey, jsonEncode(user.user));
    await sharedPreferences.setString(tokenKey, user.userToken!);
    await sharedPreferences.setBool(signInKey, user.success);
  }

  UserAuthResult getUserData() {
    String userDataJson = sharedPreferences.getString(userKey)!;
    String userToken = sharedPreferences.getString(tokenKey)!;
    bool success = sharedPreferences.getBool(signInKey)!;
    Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
    return UserAuthResult(
        user: UserModel.fromJson(userDataMap),
        userToken: userToken,
        success: success);
  }

  Future<void> clearSpecificData(String key) async {
    await sharedPreferences.remove(key);
  }

  Future<void> clearUserData() async {
    await sharedPreferences.clear();
  }
}
