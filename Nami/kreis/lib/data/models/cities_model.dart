class CitiesModel {
  final int? id;
  final String? title;
  final num? deliveryCost;
  final int? regionId;

  CitiesModel({
    required this.id,
    required this.title,
    required this.deliveryCost,
    required this.regionId,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
      id: json['id'],
      title: json['title'],
      deliveryCost: json['delivery_cost'].toDouble(),
      regionId: json['region_id'],
    );
  }
}
