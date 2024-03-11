import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreis/core/constents.dart';
import 'package:kreis/data/models/products_model.dart';
import 'package:kreis/data/repositories/items_repository.dart';
import 'package:kreis/presentation/items_page/provider/provider.dart';
import 'package:kreis/presentation/items_page/widgets/buttom_container.dart';
import 'package:kreis/widgets/custom_app_bar/app_bar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SingleItemPage extends StatefulWidget {
  int itemId;
  SingleItemPage({super.key, required this.itemId});

  @override
  State<SingleItemPage> createState() => _SingleItemPageState();
}

class _SingleItemPageState extends State<SingleItemPage> {
  late ItemsRepository itemsRepository;

  @override
  void initState() {
    super.initState();
    itemsRepository = ItemsRepository();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemsRepository.getProductsByCategoryAndSubcategory(
          Provider.of<ItemsProvider>(context).categories_id,
          Provider.of<ItemsProvider>(context).sub_categories_id),
      builder: (context, snapshot) {
        return Consumer<ItemsProvider>(
          builder: (context, value, child) {
            if (snapshot.connectionState == ConnectionState.done) {
              ProductModel? item;
              item = snapshot.data!
                  .firstWhere((product) => product.id == widget.itemId);
              return Scaffold(
                appBar: CustomAppbar(page: 'item_details'.tr(), arrow: true),
                body: SizedBox(
                  width: 375,
                  height: 634.67,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 343,
                        height: 234,
                        child: Card(child: Image.network(item.image)),
                      ),
                      SizedBox(
                        width: 343,
                        height: 42.67,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.title),
                            SvgPicture.asset('assets/images/svgs/heart.svg')
                          ],
                        ),
                      ),
                      SizedBox(
                          width: 343, height: 162, child: Text(item.details)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: SizedBox(
                          width: 343,
                          height: 164,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffEEEEEE),
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 16, 8, 16),
                                  child: SizedBox(
                                      width: 327,
                                      height: 52,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: SvgPicture.asset(
                                                        'assets/images/svgs/price.svg'),
                                                  ),
                                                  Text('price'.tr()),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    item.price.toString(),
                                                    style: appTextStyle),
                                              ),
                                            ]),
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                  child: SizedBox(
                                    width: 327,
                                    height: 48,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: SvgPicture.asset(
                                              'assets/images/svgs/minus.svg'),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                4, 12, 4, 12),
                                            height: 48,
                                            width: 199,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Center(
                                              child: Text(
                                                  item.weightUnit.toString()),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: SvgPicture.asset(
                                              'assets/images/svgs/add.svg'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: BuyButtonContainer(
                  price: 2,
                  ontap: () async {
                    ProductModel? item = snapshot.data!
                        .firstWhere((product) => product.id == widget.itemId);

                    await itemsRepository.saveProduct(item!, item.title);
                    List<String>? keysList = await itemsRepository.getKeys();

                    if (keysList == null) {
                      keysList = [];
                    }

                    keysList.add(item.title);

                    await itemsRepository.saveKeys(keysList);
                    print(item.title);
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      },
    );
  }
}
