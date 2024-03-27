import 'package:dio/dio.dart';
import 'package:kreis/data/models/user_model.dart';
import '../../core/app_url/app_url.dart';
import '../datasources/remote/dio/dio_client.dart';

class AuthRepository {
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
          UserModel user = UserModel.fromJson(userData);
          return UserAuthResult(user: user, success: true);
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
          UserModel user = UserModel.fromJson(userData);
          return UserAuthResult(user: user, success: true);
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
}

class UserAuthResult {
  final UserModel? user;
  final bool? success;

  UserAuthResult({this.user, required this.success});
}
