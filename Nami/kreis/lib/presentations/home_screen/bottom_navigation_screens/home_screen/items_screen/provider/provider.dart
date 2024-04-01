import 'package:flutter/material.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/data/repositories/items_repository.dart';

class ItemsProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  int categories_id = 39;
  // ignore: non_constant_identifier_names
  int sub_categories_id = 172;
  late ProductModel _item;
  late num _unitPrice;
  late num _price;
  int _quantity = 1;
  late num unitPrice;
  int n = 1;
  ItemsRepository itemsRepository = ItemsRepository();
  ProductModel get item => _item;
  num get price => _price;
  num get quantity => _quantity;
  bool favorite = false;
  Future<ProductModel> getItem(int itemId) async {
    List items = await itemsRepository.getProductsByCategoryAndSubcategory(
      categories_id,
      sub_categories_id,
    );
    return items.firstWhere((product) => product.id == itemId);
  }

  void setItem(ProductModel item) {
    _item = item;
    _unitPrice = item.priceWeightUnit!;
    _price = _unitPrice;
    _quantity = 1;
    notifyListeners();
  }

  void updateQuantity(int change) {
    if (_quantity + change >= 1) {
      _quantity += change;
      _price = _unitPrice * _quantity;
      notifyListeners();
    }
  }

  void updateCId(int cId) {
    categories_id = cId;
    notifyListeners();
  }

  void updateSId(int sId) {
    sub_categories_id = sId;
    notifyListeners();
  }

  // void setFavorite(bool favorite) {
  //   this.favorite = !favorite;
  //   notifyListeners();
  // }
  // void setUnitPrice(num unitPrice) {
  //   this.unitPrice = unitPrice;
  //   price = unitPrice;
  //   notifyListeners();
  // }

  // void updateNum(int cond) {
  //   cond == 0 ? n++ : n--;
  //   price = unitPrice * n;
  //   notifyListeners();
  // }
}
