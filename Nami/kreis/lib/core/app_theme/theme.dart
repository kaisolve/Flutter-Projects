import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/utils/preferences.dart';

class AppTheme {
  static bool isDarkMode() {
    Preferences preferences = Preferences();
    return preferences.isDarkMode();
  }

  static ThemeData theme(BuildContext context) {
    return ThemeData(
        primaryColor: isDarkMode() ? bodyBg : mainColor,
        scaffoldBackgroundColor: isDarkMode() ? Colors.black : Colors.white,
        primaryColorDark: mainColor,
        cardColor: isDarkMode() ? inputBgDark : Colors.white,
        toggleButtonsTheme: const ToggleButtonsThemeData(
            color: mainColor,
            selectedColor: mainColor,
            disabledColor: greyColor));
  }
}
