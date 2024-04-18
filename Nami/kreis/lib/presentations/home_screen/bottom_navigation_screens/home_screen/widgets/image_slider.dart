import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getSlider();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        if (provider.isloading) {
          return const CircularProgressIndicator(
            color: mainColor,
          );
        } else if (provider.failedtoload) {
          return const CustomText(title: 'Error: Failed to load slider items');
        } else if (provider.sliderItems.isEmpty) {
          return const CustomText(title: 'No slider items available');
        } else {
          List sliders = provider.sliderItems;
          return SizedBox(
            width: 343,
            height: 171.5,
            child: CarouselSlider.builder(
              itemCount: 4,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(sliders[itemIndex]['image']),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              options: CarouselOptions(autoPlay: true),
            ),
          );
        }
      },
    );
  }
}
