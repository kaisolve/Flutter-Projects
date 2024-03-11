import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/data/repositories/items_repository.dart';
import 'package:kreis/presentation/items_page/basket/widget/basket_card.dart';
import 'package:kreis/widgets/custom_app_bar/app_bar.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late Future<List<String>?> keysList;
  late ItemsRepository itemsRepository;

  @override
  void initState() {
    super.initState();
    itemsRepository = ItemsRepository();
    keysList = itemsRepository.getKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(page: 'basket'.tr(), arrow: true),
      body: FutureBuilder<List<String>?>(
        future: keysList,
        builder: (context, keysSnapshot) {
          if (keysSnapshot.connectionState == ConnectionState.done) {
            return FutureBuilder<List<ProductModel>>(
              future: itemsRepository.getSavedProducts(keysSnapshot.data!),
              builder: (context, productsSnapshot) {
                if (productsSnapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: productsSnapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = productsSnapshot.data![index];
                      return BasketCard(
                        image: product.image,
                        text: product.title,
                        price: product.price.toString(),
                      );
                    },
                  );
                } else if (productsSnapshot.hasError) {
                  return Text('Error: ${productsSnapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
          } else if (keysSnapshot.hasError) {
            return Text('Error: ${keysSnapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
