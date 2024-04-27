import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/map_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:kreis/presentations/widgets/custom_text_form/custom_text_form.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Address'.tr(), showBackArrow: true),
      body: Consumer<MapProvider>(builder: (context, provider, _) {
        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: provider.initialPosition,
              markers: provider.markers,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                provider.setGoogleController(controller);
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
                      controller: provider.textEditingController,
                      hint: 'Search Location',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async => await provider.searchLocation(),
                  child: const CustomSvgIcon(
                    assetName: 'searchIcon',
                    width: 48,
                    height: 48,
                  ),
                ),
              ],
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async =>
            await Provider.of<MapProvider>(context, listen: false)
                .getUserLocation(),
        label: CustomText(
          title: 'My Location'.tr(),
        ),
        icon: const CustomSvgIcon(assetName: 'lcation'),
        backgroundColor: const Color(0xffDF1C26),
      ),
    );
  }
}
