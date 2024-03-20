import 'package:kreis/data/models/category_model.dart';

class ProductModel {
  num? id;
  String? title;
  String? image;
  num? categoryId;
  CategoryModel? category;
  num? subCategoryId;
  SubCategoryItem? subCategory;
  String? details;
  dynamic salesLimit;
  num? price;
  String? unit;
  int? amount;
  num? priceWeightUnit;
  bool? isOffer;
  num? isActive;
  dynamic offerType;
  num? offerValue;
  String? offerStartDate;
  String? offerEndDate;
  num? oldPrice;
  bool? isFavorite;

  ProductModel({
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
    required this.amount,
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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
      amount: json['weight_unit'],
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'category_id': categoryId,
      'category':
          category?.toJson(), // Assuming CategoryModel has a toJson method
      'sub_category_id': subCategoryId,
      'sub_category':
          subCategory?.toJson(), // Assuming SubCategoryItem has a toJson method
      'details': details,
      'sales_limit': salesLimit,
      'price': price,
      'unit': unit,
      'weight_unit': amount,
      'price_weight_unit': priceWeightUnit,
      'is_offer': isOffer,
      'is_active': isActive,
      'offer_type': offerType,
      'offer_value': offerValue,
      'offer_start_date': offerStartDate,
      'offer_end_date': offerEndDate,
      'old_price': oldPrice,
      'is_favorite': isFavorite,
    };
  }
}
