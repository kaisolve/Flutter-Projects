class SliderModel {
  int id;
  String image;
  int categoryId;
  int subCategoryId;

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

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "image": image,
  //     "category_id": categoryId,
  //     "sub_category_id": subCategoryId
  //   };
  // }
}
