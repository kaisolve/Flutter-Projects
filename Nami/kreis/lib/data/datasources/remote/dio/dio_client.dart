import 'package:dio/dio.dart';

class DioClient {
  final Dio client = Dio();
  // final String url =
  //     'https://ecommerce.project-nami.xyz/api/user/home/categories';
  var jsonlist;

  Future<void> getData(String url) async {
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        jsonlist = response.data['data'];
        // return jsonlist;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data');
    }
  }
}
