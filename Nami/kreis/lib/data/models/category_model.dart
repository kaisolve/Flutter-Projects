class CategoryModel {
  final int id;
  final String image;
  final String title;
  final List<SubCategoryItem> subCategories;

  CategoryModel({
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
}

class SubCategoryItem {
  final int id;
  final String image;
  final String title;

  SubCategoryItem({
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
}
