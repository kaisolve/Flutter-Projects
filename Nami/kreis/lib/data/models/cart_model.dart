import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final num? id;
  final String? name;
  final String? image;
  final num? price;
  final int? amount;

  const CartModel({this.id, this.name, this.image, this.price, this.amount});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        amount: json['amount']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'amount': amount
    };
  }

  @override
  List<Object?> get props => [id, name, image, price, amount];
}
