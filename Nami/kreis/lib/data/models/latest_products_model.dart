import 'package:equatable/equatable.dart';
import 'package:kreis/data/models/category_model.dart';

// ignore: must_be_immutable
class LatestProductModel extends Equatable {
  num? id;
  String? title;
  String? image;
  num? categoryId;
  CategoryModel? category;
  num? subCategoryId;
  SubCategoryItem? subCategory;
  String? details;
  num? salesLimit;
  num? price;
  String? unit;
  num? weightUnit;
  num? priceWeightUnit;
  bool? isOffer;
  num? isActive;
  String? offerType;
  num? offerValue;
  String? offerStartDate;
  String? offerEndDate;
  num? oldPrice;
  bool? isFavorite;

  LatestProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.categoryId,
    required this.category,
    required this.subCategoryId,
    required this.subCategory,
    required this.details,
    required this.salesLimit,
    required this.price,
    required this.unit,
    required this.weightUnit,
    required this.priceWeightUnit,
    required this.isOffer,
    required this.isActive,
    required this.offerType,
    required this.offerValue,
    required this.offerStartDate,
    required this.offerEndDate,
    required this.oldPrice,
    required this.isFavorite,
  });

  factory LatestProductModel.fromJson(Map<String, dynamic> json) {
    return LatestProductModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      categoryId: json['category_id'],
      category: CategoryModel.fromJson(json['category']),
      subCategoryId: json['sub_category_id'],
      subCategory: SubCategoryItem.fromJson(json['sub_category']),
      details: json['details'],
      salesLimit: json['sales_limit'],
      price: json['price'],
      unit: json['unit'],
      weightUnit: json['weight_unit'],
      priceWeightUnit: json['price_weight_unit'],
      isOffer: json['is_offer'],
      isActive: json['is_active'],
      offerType: json['offer_type'],
      offerValue: json['offer_value'],
      offerStartDate: json['offer_start_date'],
      offerEndDate: json['offer_end_date'],
      oldPrice: json['old_price'],
      isFavorite: json['is_favorite'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        categoryId,
        category,
        subCategoryId,
        subCategory,
        details,
        salesLimit,
        price,
        unit,
        weightUnit,
        priceWeightUnit,
        isOffer,
        isActive,
        offerType,
        offerValue,
        offerStartDate,
        offerEndDate,
        oldPrice,
        isFavorite,
      ];
}
