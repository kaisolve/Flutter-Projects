import 'package:dio/dio.dart';
import 'package:kreis/core/app_url/app_url.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/products_model.dart';

class ItemsRepository {
  Future<List> getProducts() async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response = await dioClient.get(AppUrls.products);

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
      num categoryId, num subcategoryId) async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      // auth checking
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken!;
      }

      Response response = await dioClient
          .get(AppUrls.productsDetails(categoryId, subcategoryId));

      if (response.statusCode == 200) {
        List<dynamic> products = response.data['data'];

        // Filter products based on category and subcategory
        List<ProductModel> filteredProducts = products
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

  void addDelFavorites(String? token, num productId) async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);

      dioClient.dio.options.headers['Authorization'] = token;
      Response response = await dioClient.post(AppUrls.addRemfavorites,
          formData: FormData.fromMap({'product_id': productId}));
      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to change Favorites: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to change Favorites: $error');
    }
  }
}
