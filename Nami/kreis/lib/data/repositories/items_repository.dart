import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemsRepository {
  Future<List> getProducts() async {
    const String apiUrl =
        'https://ecommerce.project-nami.xyz/api/user/home/products';

    try {
      DioClient dioClient = DioClient(
        baseUrl: apiUrl,
      );
      Response response = await dioClient.get(apiUrl);

      if (response.statusCode == 200) {
        List<dynamic> products = response.data['data'];

        final List<ProductModel> productsItems = List.generate(
            products.length, (index) => ProductModel.fromJson(products[index]));
        return productsItems;
      } else {
        throw Exception('Failed to load items');
      }
    } catch (error) {
      throw Exception('Failed to load items: $error');
    }
  }

  Future<List<ProductModel>> getProductsByCategoryAndSubcategory(
      int categoryId, int subcategoryId) async {
    String apiUrl =
        'https://ecommerce.project-nami.xyz/api/user/home/products?category_id=$categoryId&sub_category_id=$subcategoryId';

    try {
      DioClient dioClient = DioClient(
        baseUrl: apiUrl,
      );
      Response response = await dioClient.get(apiUrl);

      if (response.statusCode == 200) {
        List<dynamic> products = response.data['data'];

        // Filter products based on category and subcategory
        final List<ProductModel> filteredProducts = products
            .where((product) =>
                product['category_id'] == categoryId &&
                product['sub_category_id'] == subcategoryId)
            .map((filteredProduct) => ProductModel.fromJson(filteredProduct))
            .toList();

        return filteredProducts;
      } else {
        throw Exception('Failed to load items');
      }
    } catch (error) {
      throw Exception('Failed to load items: $error');
    }
  }

  Future<void> saveProduct(ProductModel product, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(product.toJson());
    prefs.setString(key, jsonString);
  }

  Future<void> saveKeys(List<String> keysList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('keys', keysList);
  }

  Future<List<String>?> getKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? keysList = prefs.getStringList('keys');
    return keysList ?? [];
  }

  Future<List<ProductModel>> getSavedProducts(List<String> keys) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<ProductModel> allProducts = [];

    for (String key in keys) {
      String? jsonString = prefs.getString(key);

      if (jsonString != null) {
        List<dynamic> jsonList = jsonDecode(jsonString);
        List<ProductModel> products = jsonList
            .map((jsonItem) => ProductModel.fromJson(jsonItem))
            .toList();
        allProducts.addAll(products);
      }
    }

    return allProducts;
  }

  Future<void> clearBasket(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
