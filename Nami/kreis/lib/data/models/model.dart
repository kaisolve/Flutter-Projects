import 'dart:convert';

class SliderModel {
  final num id;
  final String image;
  final int category_id;
  final int sub_category_id;

  const SliderModel(
      this.id, this.image, this.category_id, this.sub_category_id);
  factory SliderModel.fromJson(Map<String, dynamic> maps) {
    return const SliderModel(
        27,
        "https://ecommerce.project-nami.xyz/storage/images/admins/sliders/IRHE35X3Kg1705154409.jpg",
        42,
        66);
  }
  Map<String, dynamic> toJson() {
    String xo = jsonEncode({
      "id": id,
      "image": image,
      "category_id": category_id,
      "sub_category_id": sub_category_id
    });
    return {
      "id": id,
      "image": image,
      "category_id": category_id,
      "sub_category_id": sub_category_id
    };
  }

  // factory named const that return instance from the class
}
