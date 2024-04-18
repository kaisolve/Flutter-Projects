import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/map_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;
  static const CameraPosition initialPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  Set<Marker> markers = {};
  final Mode mode = Mode.overlay;
  TextEditingController textEditingController = TextEditingController();
  MapProvider mapProvider = getIt();
  late String searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Address'.tr(), showBackArrow: true),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialPosition,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                child: SizedBox(
                  width: 297,
                  height: 48,
                  child: CustomTextFormField(
                    controller: textEditingController,
                    hint: 'Search Location',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async => await searchLocation(),
                child: const CustomSvgIcon(
                  assetName: 'searchIcon',
                  width: 48,
                  height: 48,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async => await getUserLocation(),
        label: CustomText(
          title: 'My Location'.tr(),
        ),
        icon: const CustomSvgIcon(assetName: 'lcation'),
        backgroundColor: const Color(0xffDF1C26),
      ),
    );
  }

  Future<void> searchLocation() async {
    searchText = textEditingController.text;
    if (searchText.isNotEmpty) {
      List<Location> locations = await locationFromAddress(searchText);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        double lat = location.latitude;
        double lng = location.longitude;
        mapProvider.location = searchText;
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 14)));
        markers.clear();
        markers.add(Marker(
          markerId: const MarkerId('searchedLocation'),
          position: LatLng(lat, lng),
        ));
      } else {
        // Handle case when no location found
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Location Not Found'),
              content:
                  const Text('Unable to find location for the given address.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const CustomText(title: 'OK'),
                ),
              ],
            );
          },
        );
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
  }
}
















// String kGoogleApi = 'AIzaSyC1wkR3O4C_8CkSQ0W3h03Ynm4kYzCG3ks';
// final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
//   Future<void> searchPlaces() async {
//     Prediction? prediction = await PlacesAutocomplete.show(
//         context: context,
//         apiKey: kGoogleApi,
//         onError: onError,
//         mode: mode,
//         language: 'en',
//         strictbounds: false,
//         types: [""],
//         decoration: InputDecoration(
//             hintText: 'Search',
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: const BorderSide(color: Colors.white))),
//         components: [Component(Component.country, "pk")]);
//     displayPrediction(prediction!, scaffoldMessengerKey.currentState);
//   }

//   void onError(PlacesAutocompleteResponse response) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
//   }

//   Future<void> displayPrediction(
//       Prediction prediction, ScaffoldMessengerState? currentState) async {
//     GoogleMapsPlaces places = GoogleMapsPlaces(
//         apiKey: kGoogleApi,
//         apiHeaders: await const GoogleApiHeaders().getHeaders());
//     PlacesDetailsResponse detailsResponse =
//         await places.getDetailsByPlaceId(prediction.placeId!);
//     final lat = detailsResponse.result.geometry!.location.lat;
//     final lng = detailsResponse.result.geometry!.location.lng;
//     markers.clear();
//     markers.add(Marker(
//         markerId: const MarkerId("0"),
//         position: LatLng(lat, lng),
//         infoWindow: InfoWindow(title: detailsResponse.result.name)));
//     setState(() {});
//     googleMapController
//         .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14));
//   }
// }

