import 'package:flutter/material.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/data/models/user_model.dart';
import 'package:kreis/data/repositories/auth_repository.dart';
import 'package:kreis/data/repositories/items_repository.dart';
import 'package:kreis/data/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  AuthRepository authRepository = AuthRepository();
  ProfileRepository profileRepository = ProfileRepository();
  ItemsRepository itemsRepository = ItemsRepository();
  Preferences preferences = Preferences();
  List favorates = [];
  bool isloading = true;
  bool isloaded = false;
  bool failedtoload = false;
  late UserModel user;
  String? image;
  int selectedLanguage = 1;
  Locale language = const Locale('ar');
  void changeLang(int lang) {
    selectedLanguage = lang;
    notifyListeners();
  }

  void getFavorates() async {
    try {
      favorates = await profileRepository.getFavorite();
      notifyListeners();
      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to load favorates: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void changeFavorite(String token, int productId, int index) {
    itemsRepository.addDelFavorites(token, productId);
    ProductModel favProduct =
        favorates.firstWhere((element) => element.id == productId);
    favProduct.isFavorite = !favProduct.isFavorite!;
    favorates.removeAt(index);
    // favorates.insert(index, favProduct);
    notifyListeners();
  }

  void changeLocale(Locale langLoc) {
    language = langLoc;
    notifyListeners();
  }

  void getUser() {
    user = Preferences().getUserData().user!;
    notifyListeners();
  }

  void updateProfile(
      String fname, String lname, String? imagePath, String token) async {
    await profileRepository.updateProfile(
        firstName: fname, lastName: lname, imagePath: imagePath, token: token);
  }

  void logoutUser(String token) {
    authRepository.logoutUser(token);
    preferences.clearUserData();
  }

  void deleteUser(String token) {
    authRepository.deleteUser(token);
  }
}
