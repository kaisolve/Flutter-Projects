import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/provider/provider.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/widget/cart_card.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/payment/payment.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/widgets/buttom_container.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartProvider cartProvider;
  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.getcartItems();
  }

  @override
  Widget build(BuildContext context) {
    cartProvider.calculateTotalPrice();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cart'.tr(),
        showBackArrow: true,
        showToolBar: true,
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, _) {
          if (provider.cartItems.isEmpty) {
            return Center(
              child: CustomText(title: 'Your cart is empty.'.tr()),
            );
          } else {
            return ListView.builder(
              itemCount: provider.cartItems.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> product = provider.cartItems[index];
                return CartCard(
                  image: product['image'],
                  text: product['name'],
                  price: provider.getItemPrice(product['id']).toString(),
                  amount: product['amount'],
                  id: product['id'],
                  onDelete: () {
                    cartProvider.removeItemFromCart(product['id']);
                  },
                  onIncrease: () {
                    cartProvider.increaseItemAmount(product['id']);
                  },
                  onDecrease: () {
                    cartProvider.decreaseItemAmount(product['id']);
                  },
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BuyButtonContainer(
        text: 'Order Now'.tr(),
        price: Provider.of<CartProvider>(context)
            .totalPrice, // You can calculate the total price
        ontap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PaymentPage(
            price: Provider.of<CartProvider>(context).totalPrice,
          ),
        )),
      ),
    );
  }
}
