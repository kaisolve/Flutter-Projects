import 'package:dio/dio.dart';

class ItemsModel {
  final int id;
  final int categoryId;
  final int subCategoryId;
  final String title;
  final String image;
  final int price;

  ItemsModel({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.title,
    required this.image,
    required this.price,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
    );
  }
  // Map<String, dynamic> toJson() {
  //   jsonEncode({
  //     "id": id,
  //     "image": image,
  //     "title": title,
  //     "price": price,
  //     "category_id": categoryId,
  //     "sub_category_id": subCategoryId
  //   });
  //   return {
  //     "id": id,
  //     "image": image,
  //     "title": title,
  //     "price": price,
  //     "category_id": categoryId,
  //     "sub_category_id": subCategoryId
  //   };
  // }
}

Future<List<ItemsModel>> fetchItems() async {
  // Replace the URL with your actual API endpoint
  const String apiUrl =
      'https://ecommerce.project-nami.xyz/api/user/home/products';

  try {
    final Dio dio = Dio();
    final Response response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      final List<dynamic> itemsData = response.data;

      // Convert the list of dynamic data into a list of ItemsModel objects
      // ignore: non_constant_identifier_names
      List<ItemsModel> Items =
          itemsData.map((item) => ItemsModel.fromJson(item)).toList();
      return Items;
    } else {
      throw Exception('Failed to load products');
    }
  } catch (error) {
    throw Exception('Failed to load products: $error');
  }
}
