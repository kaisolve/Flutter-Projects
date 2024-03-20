import 'dart:convert';

import 'package:kreis/data/models/cart_model.dart';
import 'package:kreis/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  String key = 'cart_key';

  Future<void> addTocart(CartModel cartModel) async {
    SharedPreferences prefs = getIt();

    // Retrieve existing cart items
    List<Map<String, dynamic>> cartItems = prefs
            .getStringList(key)
            ?.map((item) => Map<String, dynamic>.from(jsonDecode(item)))
            .toList() ??
        [];
    var isExist = cartItems.where((element) => element['id'] == cartModel.id);
    if (isExist.isEmpty) {
      // Add the new item to the cart
      cartItems.add(cartModel.toJson());
    }

    // Save the updated cart
    prefs.setStringList(
        key, cartItems.map((item) => jsonEncode(item)).toList());
  }

  Future<List<Map<String, dynamic>>> getcartItems() async {
    SharedPreferences prefs = getIt();
    List<String>? jsonItems = prefs.getStringList(key);

    // Decode the JSON and return the list of cart items
    return jsonItems!
        .map((item) => Map<String, dynamic>.from(jsonDecode(item)))
        .toList();
  }

  Future<void> clearcart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<String> getItemNum(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve existing cart items
    List<Map<String, dynamic>> cartItems = prefs
            .getStringList(key)
            ?.map((item) => Map<String, dynamic>.from(jsonDecode(item)))
            .toList() ??
        [];
    // var isExist = cartItems.where((element) => element['name'] == name);
    // if (isExist.isEmpty) {
    //   return cartItems.firstWhere((element) => element['name'] == name);
    // }
    return cartItems
        .firstWhere((element) => element['name'] == name)
        .toString();
  }
}
