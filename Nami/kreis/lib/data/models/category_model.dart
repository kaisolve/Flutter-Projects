import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final num? id;
  final String? image;
  final String? title;
  final List<SubCategoryItem> subCategories;

  const CategoryModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> subCategoriesData = json['sub_categories'];

    List<SubCategoryItem> subCategories = subCategoriesData
        .map((subCategory) => SubCategoryItem.fromJson(subCategory))
        .toList();

    return CategoryModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      subCategories: subCategories,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'sub_categories':
          subCategories.map((subCategory) => subCategory.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, image, title, subCategories];
}

class SubCategoryItem extends Equatable {
  final num? id;
  final String? image;
  final String? title;

  const SubCategoryItem({
    required this.id,
    required this.image,
    required this.title,
  });

  factory SubCategoryItem.fromJson(Map<String, dynamic> json) {
    return SubCategoryItem(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
    };
  }

  @override
  List<Object?> get props => [id, image, title];
}
