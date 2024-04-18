import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MapProvider extends ChangeNotifier {
  String location = "Select Location".tr();
  double? lat;
  double? lng;
  void setLocation(String loc) {
    location = loc;
    notifyListeners();
  }

  void setCameraPosition() {}

  void setPositionLL(double lat, double lng) {
    this.lat = lat;
    this.lng = lng;
  }
}
