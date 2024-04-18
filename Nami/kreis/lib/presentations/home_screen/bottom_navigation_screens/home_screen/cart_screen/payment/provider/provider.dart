import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  int selectedMethod = 1;
  void setPaymentMethod(int method) {
    selectedMethod = method;
    notifyListeners();
  }
}
