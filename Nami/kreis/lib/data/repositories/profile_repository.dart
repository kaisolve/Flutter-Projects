import 'package:dio/dio.dart';
import 'package:kreis/core/app_url/app_url.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';

class ProfileRepository {
  void updateProfile(String? firstName, String? lastName, String? image) async {
    try {
      String? imageFilePath = image;

      MultipartFile? imagePart;
      if (imageFilePath != null && !imageFilePath.startsWith('http')) {
        imagePart = await MultipartFile.fromFile(imageFilePath);
      }
      FormData formData = FormData.fromMap(
          {'first_name': firstName, 'last_name': lastName, 'image': imagePart});
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response =
          await dioClient.post(AppUrls.updateProfile, formData: formData);

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }
}
