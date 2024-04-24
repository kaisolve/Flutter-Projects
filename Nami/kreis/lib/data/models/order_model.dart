import 'package:equatable/equatable.dart';
import 'package:kreis/data/models/user_model.dart';

// ignore: must_be_immutable
class OrdersModel extends Equatable {
  String? address;
  num? delivery;
  num? lat;
  num? lng;
  String? notes;
  String? payType;
  num? netTotal;
  num? deliveryCost;
  num? isPoints;
  num? pointsCount;
  num? pointsValue;
  num? texValue;
  num? grandTotal;
  List? details;

  OrdersModel(
      {this.address,
      this.delivery,
      this.lat,
      this.lng,
      this.notes,
      this.payType,
      this.netTotal,
      this.deliveryCost,
      this.isPoints,
      this.pointsCount,
      this.pointsValue,
      this.texValue,
      this.grandTotal,
      this.details});
  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      address: json['address'],
      delivery: json['delivery'],
      lat: json['latitude'],
      lng: json['longitude'],
      notes: json['notes'],
      payType: json['pay_type'],
      netTotal: json['net_total'],
      deliveryCost: json['deliver_cost'],
      isPoints: json['is_points'] = 0,
      pointsCount: json['points_count'],
      pointsValue: json['points_value'],
      texValue: json['tax_value'],
      grandTotal: json['grand_total'],
      details: json['details'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'delivery': delivery,
      'latitude': lat,
      'longitude': lng,
      'notes': notes,
      'pay_type': payType,
      'net_total': netTotal,
      'deliver_cost': deliveryCost,
      'is_points': isPoints,
      'points_count': pointsCount,
      'points_value': pointsValue,
      'tax_value': texValue,
      'grand_total': grandTotal,
      'details': details,
    };
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OrderDetailsModel {
  int? id;
  UserModel? user;
  dynamic driverCancelReason;
  String? address;
  dynamic addressDetails;
  num? latitude;
  num? longitude;
  String? status;
  bool? isCollected;
  String? payType;
  bool? isPaid;
  bool? isPoints;
  num? pointsCount;
  num? pointsValue;
  num? driverId;
  dynamic driver;
  num? driverCost;
  num? netTotal;
  num? taxValue;
  num? deliveryPrice;
  num? grandTotal;
  String? notes;
  String? createdAt;
  String? date;
  String? time;
  List? details;

  OrderDetailsModel({
    this.id,
    this.user,
    this.driverCancelReason,
    this.address,
    this.addressDetails,
    this.latitude,
    this.longitude,
    this.status,
    this.isCollected,
    this.payType,
    this.isPaid,
    this.isPoints,
    this.pointsCount,
    this.pointsValue,
    this.driverId,
    this.driver,
    this.driverCost,
    this.netTotal,
    this.taxValue,
    this.deliveryPrice,
    this.grandTotal,
    this.notes,
    this.createdAt,
    this.date,
    this.time,
    this.details,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      user: UserModel.fromJson(json['user']),
      driverCancelReason: json['driver_cancel_reason'],
      address: json['address'],
      addressDetails: json['address_details'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      status: json['status'],
      isCollected: json['is_collected'],
      payType: json['pay_type'],
      isPaid: json['is_paid'],
      isPoints: json['is_points'],
      pointsCount: json['points_count'],
      pointsValue: json['points_value'],
      driverId: json['driver_id'],
      driver: json['driver'],
      driverCost: json['driver_cost'],
      netTotal: json['net_total'],
      taxValue: json['tax_value'],
      deliveryPrice: json['delivery_price'],
      grandTotal: json['grand_total'],
      notes: json['notes'],
      createdAt: json['created_at'],
      date: json['date'],
      time: json['time'],
      details: json['details'],
    );
  }
}
