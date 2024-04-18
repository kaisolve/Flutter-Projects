import 'package:flutter/material.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/data/repositories/items_repository.dart';

class ItemsProvider extends ChangeNotifier {
  ItemsRepository itemsRepository = ItemsRepository();
  List products = [];
  List filteredProducts = [];
  late ProductModel singleItem;
  bool isloading = true;
  bool isloaded = false;
  bool failedtoload = false;
  num categoryId = 39;
  num subCategoryId = 172;
  late num price;
  int quantity = 1;
  bool favorite = false;

  // void setSingleItem(num itemId) {}
  void setItem(num itemId, num categoryId, num subCategoryId) async {
    isloading = true;
    notifyListeners();

    try {
      await getProductsByCategoryAndSubcategory(categoryId, subCategoryId);
      singleItem = products.firstWhere((product) => product.id == itemId);
      singleItem.price = singleItem.priceWeightUnit;
      price = singleItem.priceWeightUnit!;
      singleItem.amount = 1;
      quantity = 1;
      failedtoload = false;
      isloaded = true;
      notifyListeners();
    } catch (error) {
      failedtoload = true;
      throw Exception('Failed to set item: $error');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> getProductsByCategoryAndSubcategory(num cId, num sId) async {
    try {
      products =
          await itemsRepository.getProductsByCategoryAndSubcategory(cId, sId);
      filteredProducts = products;

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

  void updateQuantity(int change) {
    if (quantity + change >= 1) {
      quantity += change;
      price = singleItem.priceWeightUnit! * quantity;
      singleItem.price = price;
      singleItem.amount = quantity;
      notifyListeners();
    }
  }

  void updateCId(int cId) {
    categoryId = cId;
    notifyListeners();
  }

  void updateSId(int sId) {
    subCategoryId = sId;
    notifyListeners();
  }

  void changeFavorite(String token, num productId, int index) {
    itemsRepository.addDelFavorites(token, productId);
    ProductModel favProduct =
        products.firstWhere((element) => element.id == productId);
    favProduct.isFavorite = !favProduct.isFavorite!;
    products.removeAt(index);
    products.insert(index, favProduct);
    setItem(productId, categoryId, subCategoryId);
    notifyListeners();
  }

  void filterProducts(String query) {
    filteredProducts = products
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
