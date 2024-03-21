import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/data/repositories/cart_repository.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/widget/cart_card.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/payment/payment.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/widgets/buttom_container.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _cartPageState();
}

class _cartPageState extends State<CartPage> {
  late CartRepository cartRepository;

  @override
  void initState() {
    super.initState();
    cartRepository = CartRepository();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cartRepository.getcartItems(),
      builder: (context, productsSnapshot) {
        if (productsSnapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'cart'.tr(),
              showBackArrow: true,
              showToolBar: true,
            ),
            body: ListView.builder(
              itemCount: productsSnapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                List product = productsSnapshot.data![index].values.toList();
                return CartCard(
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
                builder: (context) => const PaymentPage(),
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
