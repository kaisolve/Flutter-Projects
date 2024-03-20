import 'package:dio/dio.dart';
import 'package:kreis/core/app_url/app_url.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/products_model.dart';

class ItemsRepository {
  Future<List> getProducts() async {
    try {
      DioClient dioClient = DioClient(
        baseUrl: AppUrls.baseUrl,
      );
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
      int categoryId, int subcategoryId) async {
    try {
      DioClient dioClient = DioClient(
        baseUrl: AppUrls.baseUrl,
      );
      AppUrls.categoryId = categoryId;
      AppUrls.categoryId = subcategoryId;
      Response response = await dioClient.get(AppUrls.productsDetails);

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
}
