import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final num? id;
  final String? name;
  final String? image;
  final num? price;
  final num? priceWeightUnit;
  final int? amount;

  const CartModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.amount,
      required this.priceWeightUnit});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        priceWeightUnit: json['price_weight_unit'],
        amount: json['amount']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'price_weight_unit': priceWeightUnit,
      'amount': amount
    };
  }

  @override
  List<Object?> get props => [id, name, image, price, amount];
}
