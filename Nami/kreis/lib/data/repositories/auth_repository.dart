import 'package:dio/dio.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/models/user_model.dart';
import '../../core/app_url/app_url.dart';
import '../datasources/remote/dio/dio_client.dart';

class UserAuthResult {
  final UserModel? user;
  final String? userToken;
  final bool success;

  UserAuthResult({this.user, this.userToken, this.success = true});
}

class AuthRepository {
  Preferences preferences = Preferences();
  Future<UserAuthResult> loginUser(String phoneNumber) async {
    try {
      FormData formData =
          FormData.fromMap({'phone': phoneNumber, 'phone_code': '+20'});
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response =
          await dioClient.post(AppUrls.login, formData: formData);

      if (response.statusCode == 200) {
        if (response.data != null &&
            response.data['data'] != null &&
            response.data['data']['user'] != null) {
          Map<String, dynamic> userData = response.data['data']['user'];
          String userToken = response.data['data']['auth']['token'];
          UserModel user = UserModel.fromJson(userData);
          return UserAuthResult(
              user: user, userToken: userToken, success: true);
        } else {
          return UserAuthResult(success: false);
        }
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  Future<UserAuthResult> registerUser({
    required String firstName,
    required String lastName,
    required String phoneCode,
    required String phone,
    String? invitationCode,
    String? image,
    required int cityId,
  }) async {
    try {
      // upload image
      String? imageFilePath = image;

      MultipartFile? imagePart;
      if (imageFilePath != null && !imageFilePath.startsWith('http')) {
        imagePart = await MultipartFile.fromFile(imageFilePath);
      }

      FormData formData = FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'phone_code': phoneCode,
        'phone': phone,
        'image': imagePart,
        'invitation_code': invitationCode,
        'city_id': cityId,
      });
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response =
          await dioClient.post(AppUrls.register, formData: formData);

      if (response.statusCode == 200) {
        if (response.data != null &&
            response.data['data'] != null &&
            response.data['data']['user'] != null) {
          Map<String, dynamic> userData = response.data['data']['user'];
          String userToken = response.data['data']['auth']['token'];
          UserModel user = UserModel.fromJson(userData);
          return UserAuthResult(
              user: user, userToken: userToken, success: true);
        } else {
          return UserAuthResult(success: false);
        }
      } else {
        throw Exception('Failed to register user: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to register user: $error');
    }
  }

  void logoutUser(String? token) async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      dioClient.dio.options.headers['Authorization'] = token;
      Response response =
          await dioClient.post(AppUrls.logout, formData: FormData.fromMap({}));
      if (response.statusCode == 200) {
        await preferences.clearUserData();
      } else {
        throw Exception('Failed to logout user: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to logout user: $error');
    }
  }

  void deleteUser(String? token) async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      dioClient.dio.options.headers['Authorization'] = token;
      Response response = await dioClient.post(AppUrls.deleteAccount,
          formData: FormData.fromMap({}));
      if (response.statusCode == 200) {
        preferences.clearUserData();
      } else {
        throw Exception('Failed to delete user: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to delete user: $error');
    }
  }
}
