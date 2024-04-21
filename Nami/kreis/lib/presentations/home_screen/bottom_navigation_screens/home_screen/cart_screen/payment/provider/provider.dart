import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  int selectedMethod = 1;
  bool ischecked = false;
  void setPaymentMethod(int method) {
    selectedMethod = method;
    notifyListeners();
  }

  void isChecked(bool checked) {
    ischecked = checked;
    notifyListeners();
  }
}
