import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

class SingleItemCard extends StatelessWidget {
  const SingleItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemsProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              const CustomSvgIcon(assetName: 'price'),
              const SizedBox(width: 10),
              CustomText(title: '${'Price'.tr()}${itemsProvider.price}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              GestureDetector(
                onTap: () => itemsProvider.updateQuantity(-1),
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 10),
              CustomText(
                  title: '${'Quantity:'.tr()} ${itemsProvider.quantity}'),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => itemsProvider.updateQuantity(1),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
