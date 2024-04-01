import 'package:dio/dio.dart';
import 'package:kreis/core/app_url/app_url.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/cities_model.dart';

class CitiesRepositories {
  Future<List<CitiesModel>> getLocations() async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      Response response = await dioClient.get(AppUrls.cities);

      if (response.statusCode == 200) {
        final List<dynamic> cities = response.data['data'];

        List<CitiesModel> locations =
            cities.map((json) => CitiesModel.fromJson(json)).toList();

        return locations;
      } else {
        throw Exception('Failed to load cities');
      }
    } catch (error) {
      throw Exception('Failed to load cities: $error');
    }
  }
}
