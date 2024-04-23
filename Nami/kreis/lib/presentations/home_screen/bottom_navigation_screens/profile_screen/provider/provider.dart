import 'package:flutter/material.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/data/models/user_model.dart';
import 'package:kreis/data/repositories/auth_repository.dart';
import 'package:kreis/data/repositories/items_repository.dart';
import 'package:kreis/data/repositories/order_repository.dart';
import 'package:kreis/data/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  AuthRepository authRepository = AuthRepository();
  ProfileRepository profileRepository = ProfileRepository();
  ItemsRepository itemsRepository = ItemsRepository();
  OrderRepository orderRepository = OrderRepository();
  Preferences preferences = Preferences();
  List favorates = [];
  List pointsHistory = [];
  List orders = [];
  num totalPoints = 0;
  bool isloading = true;
  bool isloaded = false;
  bool failedtoload = false;
  bool cur = true;
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
    notifyListeners();
  }

  void getPoints() async {
    PointsData pointsData = await profileRepository.getPoints();
    pointsHistory = pointsData.history!;
    totalPoints = pointsData.points!;
    notifyListeners();
  }

  void changeOrders(bool cur) {
    this.cur = cur;
    notifyListeners();
  }

  void getOrders() async {
    orders = await orderRepository.getOrder(cur ? 'new' : 'old');
    // list containing list of data,
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

  Future<void> updateProfile(
      String fname, String lname, String? imagePath, String token) async {
    await profileRepository.updateProfile(
        firstName: fname, lastName: lname, imagePath: imagePath, token: token);
  }

  void contactUs(String name, String subject, String message, String phone) {
    profileRepository.contactUS(
        name: name, subject: subject, message: message, phone: phone);
  }

  void logoutUser(String token) async {
    authRepository.logoutUser(token);
    await preferences.clearUserData();
  }

  void deleteUser(String token) {
    authRepository.deleteUser(token);
  }
}
