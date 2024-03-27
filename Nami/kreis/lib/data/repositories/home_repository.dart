import 'package:dio/dio.dart';
import 'package:kreis/core/app_url/app_url.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/category_model.dart';
import 'package:kreis/data/models/latest_products_model.dart';

class HomeRepository {
  Future<List> getSliderAndNotificationCount() async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response = await dioClient.get(AppUrls.baseUrl + AppUrls.slider);

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
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response =
          await dioClient.get(AppUrls.baseUrl + AppUrls.categories);

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
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response = await dioClient
          .get(AppUrls.baseUrl + AppUrls.subCategories + cId.toString());

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
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      // auth checking
      // if(){

      // }
      // dioClient.dio.options.headers['Authorization'] = '';
      Response response =
          await dioClient.get(AppUrls.baseUrl + AppUrls.latestProducts);

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
