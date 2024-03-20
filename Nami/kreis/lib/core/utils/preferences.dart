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
}
