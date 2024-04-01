import 'package:equatable/equatable.dart';

class ItemsModel extends Equatable {
  final int? id;
  final int? categoryId;
  final int? subCategoryId;
  final String? title;
  final String? image;
  final int? price;

  const ItemsModel({
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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "price": price,
      "category_id": categoryId,
      "sub_category_id": subCategoryId
    };
  }

  @override
  List<Object?> get props =>
      [id, categoryId, subCategoryId, title, image, price];
}
