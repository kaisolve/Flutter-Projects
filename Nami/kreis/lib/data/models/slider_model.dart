import 'package:equatable/equatable.dart';

class SliderModel extends Equatable {
  final num? id;
  final String? image;
  final num? categoryId;
  final num? subCategoryId;

  const SliderModel({
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

  @override
  List<Object?> get props => [id, image, categoryId, subCategoryId];
}
