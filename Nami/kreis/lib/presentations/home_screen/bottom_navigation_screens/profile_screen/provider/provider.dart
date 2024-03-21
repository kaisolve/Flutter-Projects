import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  int selectedLanguage = 1;
  Locale language = const Locale('ar');
  void changeLang(int lang) {
    selectedLanguage = lang;
    notifyListeners();
  }

  void changeLocale(Locale langLoc) {
    language = langLoc;
    notifyListeners();
  }
}
