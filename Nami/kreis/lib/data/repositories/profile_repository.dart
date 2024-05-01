import 'package:dio/dio.dart';
import 'package:kreis/core/app_url/app_url.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/data/models/user_model.dart';
import 'package:kreis/data/repositories/auth_repository.dart';

class ProfileRepository {
  Preferences preferences = Preferences();

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    String? imagePath,
    required String token,
  }) async {
    try {
      MultipartFile? imagePart;
      if (imagePath != null && !imagePath.startsWith('http')) {
        imagePart = await MultipartFile.fromFile(imagePath);
      }
      FormData formData = FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'image': imagePart,
      });

      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      dioClient.dio.options.headers['Authorization'] = token;

      Response response = await dioClient.post(
        AppUrls.updateProfile,
        formData: formData,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = response.data['data']['user'];
        UserModel user = UserModel.fromJson(userData);
        String userToken = response.data['data']['auth']['token'];

        await preferences.saveUserDataToSP(
          UserAuthResult(user: user, userToken: userToken),
        );
      } else {
        throw Exception('Failed to update profile: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to update profile: $error');
    }
  }

  Future<List> getFavorite() async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      // auth checking
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken;
      }
      Response response =
          await dioClient.get(AppUrls.baseUrl + AppUrls.myFavorites);

      if (response.statusCode == 200) {
        List<dynamic> products = response.data['data'];

        final List<ProductModel> favoriteItems = List.generate(
            products.length, (index) => ProductModel.fromJson(products[index]));
        return favoriteItems;
      } else {
        throw Exception('Failed to load items');
      }
    } catch (error) {
      throw Exception('Failed to load items: $error');
    }
  }

  void contactUS(
      {required String name,
      String? email,
      required String subject,
      required String message,
      required String phone}) async {
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
      'phone': phone,
    });
    DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
    Response response =
        await dioClient.post(AppUrls.contactUs, formData: formData);
    if (response.statusCode == 200) {}
  }

  Future<PointsData> getPoints() async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken;
      }
      Response response = await dioClient.get(AppUrls.pointsHistory);
      if (response.statusCode == 200) {
        num totalPoints = response.data['data']['points'];
        final history = response.data['data']['history'];

        return PointsData(history: history, points: totalPoints);
      } else {
        throw Exception('Failed to get points data');
      }
    } catch (error) {
      throw Exception('Failed to get points data: $error');
    }
  }

  Future<String> aboutUs() async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken;
      }
      Response response = await dioClient.get(AppUrls.about);
      if (response.statusCode == 200) {
        String about = response.data['data']['about_us'];
        return about;
      } else {
        throw Exception('Failed to get settings data');
      }
    } catch (error) {
      throw Exception('Failed to get settings data: $error');
    }
  }
}

class PointsData {
  num? points;
  List? history;
  PointsData({this.history, this.points});
}
