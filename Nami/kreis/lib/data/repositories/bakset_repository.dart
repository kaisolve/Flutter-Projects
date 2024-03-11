import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class BasketRepository {
  String key = 'basket_key';

  Future<void> addToBasket(
    String name,
    double price,
    String image,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve existing basket items
    List<Map<String, dynamic>> basketItems = prefs
            .getStringList(key)
            ?.map((item) => Map<String, dynamic>.from(jsonDecode(item)))
            .toList() ??
        [];

    // Add the new item to the basket
    basketItems.add({
      'name': name,
      'price': price,
      'image': image,
    });

    // Save the updated basket
    prefs.setStringList(
        key, basketItems.map((item) => jsonEncode(item)).toList());
  }

  Future<List<Map<String, dynamic>>> getBasketItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonItems = prefs.getStringList(key);

    if (jsonItems != null) {
      // Decode the JSON and return the list of basket items
      return jsonItems
          .map((item) => Map<String, dynamic>.from(jsonDecode(item)))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> clearBasket() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
