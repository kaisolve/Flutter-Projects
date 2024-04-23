import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreis/presentations/widgets/dialogs/scaffold_messanger.dart';

class MapProvider extends ChangeNotifier {
  String location = "Select Location".tr();
  num? lat;
  num? lng;
  late GoogleMapController googleMapController;
  CameraPosition initialPosition = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  Set<Marker> markers = {};
  final Mode mode = Mode.overlay;
  TextEditingController textEditingController = TextEditingController();
  late String searchText;

  void setLocation(String loc) {
    location = loc;
    notifyListeners();
  }

  Future<void> searchLocation() async {
    searchText = textEditingController.text;
    if (searchText.isNotEmpty) {
      List<Location> locations = await locationFromAddress(searchText);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        double lat = location.latitude;
        double lng = location.longitude;
        this.location = searchText;
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 14)));
        markers.clear();
        markers.add(Marker(
          markerId: const MarkerId('searchedLocation'),
          position: LatLng(lat, lng),
        ));
        this.lat = lat;
        this.lng = lng;

        notifyListeners();
      } else {
        CustomScaffoldMessanger.showScaffoledMessanger(
            title: 'No Location Found');
      }
    }
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    // check if gps is enabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('location services are disabled');
    }

    // check for location permisions
    // if it's denied then ask for it if still then show denied
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('permision is denied');
      }
    }

    // check if denied forever
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('permision is permenantly denied');
    }

    // if all is good get the position
    Position position = await Geolocator.getCurrentPosition();
    // return position;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.latitude), zoom: 14)));
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.latitude)));
    lat = position.latitude;
    lng = position.longitude;
    notifyListeners();

    notifyListeners();
  }

  void setPositionLL(double lat, double lng) {
    this.lat = lat;
    this.lng = lng;
    notifyListeners();
  }

  void setGoogleController(GoogleMapController controller) {
    googleMapController = controller;
    notifyListeners();
  }
}
