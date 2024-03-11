import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kreis/data/models/slider_model.dart';
import 'package:kreis/data/repositories/home_repository.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late HomeRepository homeRepository;

  List<SliderModel> sliderItems = [];

  @override
  void initState() {
    super.initState();
    homeRepository = HomeRepository();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeRepository.getSliderAndNotificationCount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List sliders = snapshot.data!;
          return SizedBox(
            width: 375,
            height: 171.5,
            child: CarouselSlider.builder(
              itemCount: 4,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: Image.network(
                      sliders[itemIndex]['image'],
                      width: 343,
                      height: 171.5,
                    )),
              ),
              options: CarouselOptions(autoPlay: true),
            ),
          );
          // return Column(
          //   children: [
          //     SizedBox(
          //       width: 343,
          //       height: 171.5,
          //       child: CarouselSlider(

          //         items: sliders
          //             .map((item) =>
          //                 Image.network(item['image'], fit: BoxFit.cover))
          //             .toList(),
          //         options: CarouselOptions(
          //           viewportFraction: 1.0,
          //           autoPlay: true,
          //         ),
          //       ),
          //     ),
          //   ],
          // );
        } else if (snapshot.hasError) {
          // Display an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // Display a loading indicator
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
