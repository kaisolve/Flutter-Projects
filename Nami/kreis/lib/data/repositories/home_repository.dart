import 'package:dio/dio.dart';
import 'package:kreis/core/app_url/app_url.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/category_model.dart';
import 'package:kreis/data/models/latest_products_model.dart';

class HomeRepository {
  Preferences preferences = Preferences();
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

  Future<List<CategoryModel>> getCategories() async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response =
          await dioClient.get(AppUrls.baseUrl + AppUrls.categories);

      if (response.statusCode == 200) {
        List<dynamic> categoriesData = response.data['data'];
        final List<CategoryModel> categoryItems =
            categoriesData.map((data) => CategoryModel.fromJson(data)).toList();
        return categoryItems;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
  }

  Future<List> getSubCategories(num cId) async {
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
        throw Exception('Failed to load subCategories');
      }
    } catch (error) {
      throw Exception('Failed to load subCategories: $error');
    }
  }

  Future<List> getLatestProducts() async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      // auth checking
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken;
      }
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
