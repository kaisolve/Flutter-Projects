import 'package:dio/dio.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/category_model.dart';
import 'package:kreis/data/models/latest_products_model.dart';

class HomeRepository {
  Future<List> getSliderAndNotificationCount() async {
    const String apiUrl =
        'https://ecommerce.project-nami.xyz/api/user/home/slider';

    try {
      DioClient dioClient = DioClient(baseUrl: apiUrl);
      Response response = await dioClient.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> sliders = response.data['data']['slider'];

        return sliders;
      } else {
        throw Exception('Failed to load items');
      }
    } catch (error) {
      throw Exception('Failed to load items: $error');
    }
  }

  Future<List> getCategories() async {
    const String apiUrl =
        'https://ecommerce.project-nami.xyz/api/user/home/categories';

    try {
      DioClient dioClient = DioClient(baseUrl: apiUrl);
      Response response = await dioClient.get(apiUrl);

      if (response.statusCode == 200) {
        List<dynamic> categories = response.data['data'];
        final List<CategoryModel> categoryItems = List.generate(
            categories.length,
            (index) => CategoryModel.fromJson(categories[index]));
        return categoryItems;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
  }

  Future<List> getSubCategories(int cId) async {
    String apiUrl =
        'https://ecommerce.project-nami.xyz/api/user/home/sub-categories/$cId';

    try {
      DioClient dioClient = DioClient(baseUrl: apiUrl);
      Response response = await dioClient.get(apiUrl);

      if (response.statusCode == 200) {
        List<dynamic> subCategories = response.data['data'];
        final List<SubCategoryItem> subCategoryItems = List.generate(
            subCategories.length,
            (index) => SubCategoryItem.fromJson(subCategories[index]));

        return subCategoryItems.reversed.toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
  }

  Future<List> getLatestProducts() async {
    const String apiUrl =
        'https://ecommerce.project-nami.xyz/api/user/home/latestProducts';

    try {
      DioClient dioClient = DioClient(baseUrl: apiUrl);
      Response response = await dioClient.get(apiUrl);

      if (response.statusCode == 200) {
        List<dynamic> products = response.data['data'];

        final List<LatestProductModel> productsItems = List.generate(
            products.length,
            (index) => LatestProductModel.fromJson(products[index]));
        return productsItems;
      } else {
        throw Exception('Failed to load items');
      }
    } catch (error) {
      throw Exception('Failed to load items: $error');
    }
  }
}
