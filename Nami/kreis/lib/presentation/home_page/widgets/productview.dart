import 'package:flutter/material.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final DioClient client = DioClient();

    return Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: client.getData(
              'https://ecommerce.project-nami.xyz/api/user/home/categories'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Card(
                    child: Image.network(client.jsonlist[0]['image']),
                  )
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
        ));
  }
}
