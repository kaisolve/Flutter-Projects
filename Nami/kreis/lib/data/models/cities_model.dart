import 'package:equatable/equatable.dart';

class CitiesModel extends Equatable {
  final int? id;
  final String? title;
  final double? deliveryCost;
  final int? regionId;

  const CitiesModel({
    required this.id,
    required this.title,
    required this.deliveryCost,
    required this.regionId,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
      id: json['id'],
      title: json['title'],
      deliveryCost: json['delivery_cost']?.toDouble(),
      regionId: json['region_id'],
    );
  }

  @override
  List<Object?> get props => [id, title, deliveryCost, regionId];
}
