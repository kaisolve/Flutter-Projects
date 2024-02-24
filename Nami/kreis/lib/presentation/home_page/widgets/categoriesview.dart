import 'package:flutter/material.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/presentation/home_page/widgets/categories_card.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final DioClient client = DioClient();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
          height: 250,
          width: 375,
          child: FutureBuilder(
            future: client.getData(
                'https://ecommerce.project-nami.xyz/api/user/home/categories'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    CategoriesRows(start: 0, list: client.jsonlist),
                    CategoriesRows(
                      start: 4,
                      list: client.jsonlist,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                // Display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                // Display a loading indicator
                return const CircularProgressIndicator();
              }
            },
          )),
    );
  }
}

// ignore: must_be_immutable
class CategoriesRows extends StatelessWidget {
  int start;
  var list;
  CategoriesRows({super.key, required this.start, required this.list});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (subIndex) {
        final item = list[start + subIndex];
        return CategoriesCard(title: item['title']!, image: item['image']!);
      }),
    );
  }
}
