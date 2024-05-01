import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/models/order_model.dart';
import 'package:kreis/data/repositories/order_repository.dart';

class PaymentProvider extends ChangeNotifier {
  TextEditingController notes = TextEditingController();
  OrderRepository orderRepository = OrderRepository();

  void storeOrders(
      {required num lat,
      required num lng,
      required String address,
      required num total,
      required List details,
      required String notes}) async {
    await orderRepository.storeOrder(OrdersModel(
        address: address,
        delivery: 1,
        lat: lat,
        lng: lng,
        notes: notes,
        payType: 'cash',
        netTotal: total,
        deliveryCost: 0,
        isPoints: 0,
        pointsCount: 0,
        pointsValue: 0,
        texValue: total * 0.15,
        grandTotal: total + total * 0.15,
        details: details));
    Preferences().clearSpecificData(cartKey);
    notifyListeners();
  }
}
