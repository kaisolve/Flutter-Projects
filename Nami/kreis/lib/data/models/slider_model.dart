class SliderModel {
  num? id;
  String? image;
  num? categoryId;
  num? subCategoryId;

  SliderModel({
    required this.id,
    required this.image,
    required this.categoryId,
    required this.subCategoryId,
  });

  // Named constructor to create an instance from JSON data
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['slider']['id'],
      image: json['slider']['image'],
      categoryId: json['slider']['category_id'],
      subCategoryId: json['slider']['sub_category_id'],
    );
  }
}
