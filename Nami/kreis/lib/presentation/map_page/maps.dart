import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreis/widgets/custom_app_bar/app_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(37.15478, -122.78945));
  // static const CameraPosition

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(page: 'maps'.tr(), arrow: true),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'location'.tr(),
          style: TextStyle(color: Colors.white),
        ),
        icon: SvgPicture.asset('assets/images/svgs/lcation.svg'),
        backgroundColor: Color(0xffDF1C26),
      ),
    );
  }
}
