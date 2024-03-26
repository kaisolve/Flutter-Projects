import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/data/models/cart_model.dart';
import 'package:kreis/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  SharedPreferences prefs = getIt();
  late List<Map<String, dynamic>> cartItems;
  num totalPrice = 0;

  void calculateTotalPrice() {
    getcartItems();
    totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += getItemPrice(item['id']);
    }
    notifyListeners();
  }

  Future<void> addTocart(CartModel cartModel) async {
    // Retrieve existing cart items
    await getcartItems();

    // Check if the item is already in the cart
    bool isExist = isItemExist(cartModel.id!);
    if (!isExist) {
      // Add the new item to the cart
      cartItems.add(cartModel.toJson());
    } else {
      // Update the amount of the existing item
      var updatedCartItems = cartItems.map((item) {
        if (item['id'] == cartModel.id) {
          return {
            ...item,
            'amount': (item['amount'] as int) + 1, // Increase amount by 1
            'price': (item['price_weight_unit'] as int) * item['amount'],
          };
        }
        return item;
      }).toList();

      cartItems = updatedCartItems; // Assign updated list back to cartItems
    }

    // Save the updated cart
    await prefs.setStringList(
        cartKey, cartItems.map((item) => jsonEncode(item)).toList());
    notifyListeners();
  }

  Future<void> removeItemFromCart(num id) async {
    // Retrieve existing cart items
    await getcartItems();

    // Remove the item from the cart
    cartItems.removeWhere((item) => item['id'] == id);

    // Save the updated cart
    await prefs.setStringList(
        cartKey, cartItems.map((item) => jsonEncode(item)).toList());
    notifyListeners();
  }

  Future<void> increaseItemAmount(num id) async {
    // Retrieve existing cart items
    await getcartItems();

    // Increase the amount of the specific item
    var index = cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      cartItems[index]['amount'] += 1;
      cartItems[index]['price'] =
          cartItems[index]['price_weight_unit'] * cartItems[index]['amount'];
    }

    // Save the updated cart
    await prefs.setStringList(
        cartKey, cartItems.map((item) => jsonEncode(item)).toList());
    notifyListeners();
  }

  Future<void> decreaseItemAmount(num id) async {
    // Retrieve existing cart items
    await getcartItems();

    // Decrease the amount of the specific item
    var index = cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1 && cartItems[index]['amount']! > 1) {
      cartItems[index]['amount'] -= 1;
      cartItems[index]['price'] =
          cartItems[index]['price_weight_unit'] * cartItems[index]['amount'];
    }

    // Save the updated cart
    await prefs.setStringList(
        cartKey, cartItems.map((item) => jsonEncode(item)).toList());
    notifyListeners();
  }

  int getItemAmount(num id) {
    // Retrieve existing cart items
    getcartItems();

    // Get the amount of the specific item
    var index = cartItems.indexWhere((item) => item['id'] == id);
    return index != -1 ? cartItems[index]['amount'] as int : 1;
  }

  int getItemPrice(num id) {
    // Retrieve existing cart items
    getcartItems();

    // Get the amount of the specific item
    var index = cartItems.indexWhere((item) => item['id'] == id);
    return index != -1 ? cartItems[index]['price'] as int : 0;
  }

  Future<void> getcartItems() async {
    List<String>? jsonItems = prefs.getStringList(cartKey);

    // Decode the JSON and return the list of cart items
    cartItems = jsonItems!
        .map((item) => Map<String, dynamic>.from(jsonDecode(item)))
        .toList();
  }

  void clearcart() async {
    await prefs.remove(cartKey);
    notifyListeners();
  }

  bool isItemExist(num id) {
    getcartItems();

    // Check if the item is already in the cart
    bool isExist = cartItems.any((item) => item['id'] == id);
    return isExist;
  }
}
