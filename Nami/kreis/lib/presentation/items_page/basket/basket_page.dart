import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/data/repositories/bakset_repository.dart';
import 'package:kreis/presentation/items_page/basket/widget/basket_card.dart';
import 'package:kreis/presentation/items_page/payment/payment.dart';
import 'package:kreis/presentation/items_page/widgets/buttom_container.dart';
import 'package:kreis/widgets/custom_app_bar/app_bar.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({
    super.key,
  });

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late BasketRepository basketRepository;

  @override
  void initState() {
    super.initState();
    basketRepository = BasketRepository();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: basketRepository.getBasketItems(),
      builder: (context, productsSnapshot) {
        if (productsSnapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: CustomAppbar(page: 'basket'.tr(), arrow: true),
            body: ListView.builder(
              itemCount: productsSnapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                List product = productsSnapshot.data![index].values.toList();
                return BasketCard(
                  image: product[0]['image'],
                  text: product[0]['name'],
                  price: product[0]['price'].toString(),
                  weight: product[0]['weight'],
                );
              },
            ),
            bottomNavigationBar: BuyButtonContainer(
              text: 'order_now'.tr(),
              price: 20,
              ontap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PaymentPage(),
              )),
            ),
          );
        } else if (productsSnapshot.hasError) {
          return Text('Error: ${productsSnapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
