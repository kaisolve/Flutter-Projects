import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class BasketRepository {
  String key = 'basket_key';

  Future<void> addToBasket(
    String name,
    double price,
    int weight,
    String image,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve existing basket items
    List<Map<String, dynamic>> basketItems = prefs
            .getStringList(key)
            ?.map((item) => Map<String, dynamic>.from(jsonDecode(item)))
            .toList() ??
        [];
    var isExist = basketItems.where((element) => element['name'] == name);
    if (isExist.isEmpty) {
      // Add the new item to the basket
      basketItems.add({
        name: {
          'name': name,
          'price': price,
          'image': image,
          'weight': weight,
        }
      });
    }

    // Save the updated basket
    prefs.setStringList(
        key, basketItems.map((item) => jsonEncode(item)).toList());
  }

  Future<List<Map<String, dynamic>>> getBasketItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonItems = prefs.getStringList(key);

    // Decode the JSON and return the list of basket items
    return jsonItems!
        .map((item) => Map<String, dynamic>.from(jsonDecode(item)))
        .toList();
    }

  Future<void> clearBasket() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<String> getItemNum(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve existing basket items
    List<Map<String, dynamic>> basketItems = prefs
            .getStringList(key)
            ?.map((item) => Map<String, dynamic>.from(jsonDecode(item)))
            .toList() ??
        [];
    // var isExist = basketItems.where((element) => element['name'] == name);
    // if (isExist.isEmpty) {
    //   return basketItems.firstWhere((element) => element['name'] == name);
    // }
    return basketItems
        .firstWhere((element) => element['name'] == name)
        .toString();
  }
}
