import 'package:flutter/material.dart';
import 'package:kreis/data/models/category_model.dart';
import 'package:kreis/data/models/latest_products_model.dart';
import 'package:kreis/data/repositories/home_repository.dart';
import 'package:kreis/data/repositories/items_repository.dart';

class HomeProvider extends ChangeNotifier {
  HomeRepository homeRepository = HomeRepository();
  ItemsRepository itemsRepository = ItemsRepository();
  List latestProducts = [];
  List<CategoryModel> categories = [];
  List subCategories = [];
  List sliderItems = [];
  bool isloading = true;
  bool isloaded = false;
  bool failedtoload = false;

  void getLatestProducts() async {
    try {
      List fetchedProducts = await homeRepository.getLatestProducts();
      latestProducts.clear();
      latestProducts.addAll(fetchedProducts);
      notifyListeners();

      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to load products: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void getCategories() async {
    try {
      List<CategoryModel> fetchedCategories =
          await homeRepository.getCategories();
      categories.clear();
      categories.addAll(fetchedCategories);
      notifyListeners();

      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to load categories: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void getSubCategories(num cId) async {
    try {
      List fetchedSubCategories = await homeRepository.getSubCategories(cId);
      subCategories.clear();
      subCategories.addAll(fetchedSubCategories);
      notifyListeners();
      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to load subCategories: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void getSlider() async {
    try {
      List fetchedSliders =
          await homeRepository.getSliderAndNotificationCount();
      sliderItems.clear();
      sliderItems.addAll(fetchedSliders);
      notifyListeners();

      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to load slider items: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void changeFavorite(String token, int productId, int index) {
    itemsRepository.addDelFavorites(token, productId);
    LatestProductModel favProduct =
        latestProducts.firstWhere((element) => element.id == productId);
    favProduct.isFavorite = !favProduct.isFavorite!;
    latestProducts.removeAt(index);
    latestProducts.insert(index, favProduct);
    notifyListeners();
  }
}
