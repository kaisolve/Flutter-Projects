import 'package:flutter/material.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/models/order_model.dart';
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
  String? about;
  List favorates = [];
  List pointsHistory = [];
  List<OrderDetailsModel> orders = [];
  OrderDetailsModel singleOrder = OrderDetailsModel();
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
    isloaded = false;
    isloading = true;
    notifyListeners();
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
    isloaded = false;
    isloading = true;
    notifyListeners();
    try {
      PointsData pointsData = await profileRepository.getPoints();
      pointsHistory = pointsData.history!;
      totalPoints = pointsData.points!;
      notifyListeners();
      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to load points: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void changeOrders(bool cur) {
    this.cur = cur;
    notifyListeners();
  }

  void getOrders(String status) async {
    // isloaded = false;
    // isloading = true;
    // notifyListeners();
    try {
      // orders is list of all orders so you can go to details to get specific data
      orders = await orderRepository.getOrder(status);
      notifyListeners();
      // failedtoload = false;
      // isloaded = true;
      // notifyListeners();
    } catch (error) {
      // failedtoload = true;
      throw Exception('Failed to load orders: $error');
    }
    // finally {
    //   isloading = false;
    //   notifyListeners();
    // }
  }

  void getSingleOrder(String id) async {
    isloaded = false;
    isloading = true;
    notifyListeners();
    try {
      singleOrder = await orderRepository.getOneOrder(id);
      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to get single order: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void aboutUS() async {
    isloaded = false;
    isloading = true;
    notifyListeners();
    try {
      about = await profileRepository.aboutUs();
      notifyListeners();
      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to load settings: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void cancelOrder(int id) async {
    await orderRepository.cancelOrder(id);
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
