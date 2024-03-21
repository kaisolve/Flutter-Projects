import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreis/data/repositories/cart_repository.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/cart_screen/payment/paycheck.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/widgets/buttom_container.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/map_page/maps.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
            appBar: CustomAppBar(title: 'payment'.tr(), showBackArrow: true),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      width: 343,
                      height: 400,
                      decoration: BoxDecoration(
                          color: const Color(0xffdf1c26).withAlpha(5),
                          borderRadius: BorderRadius.circular(12)),
                      child: ListView.builder(
                        itemCount: productsSnapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          List product =
                              productsSnapshot.data![index].values.toList();
                          return ListTile(
                            leading: SizedBox(
                              width: 72,
                              height: 48,
                              child: Image.network(
                                product[0]['image'],
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                                product[0]['name'].toString().split(' ')[0]),
                            subtitle: Text(product[0]['weight'].toString()),
                            trailing: Text(
                                style: const TextStyle(fontSize: 16),
                                'total '.tr() + product[0]['price'].toString()),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: CustomListTile(
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MapPage(),
                        ));
                      },
                      arrow: true,
                      image: 'assets/images/svgs/location.svg',
                      text: 'address'.tr(),
                      subtext: 'map address',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: CustomListTile(
                      ontap: () {},
                      arrow: true,
                      image: 'assets/images/svgs/cash.svg',
                      text: 'how_to_pay'.tr(),
                      subtext: 'cash'.tr(),
                    ),
                  ),
                  SizedBox(
                    width: 343,
                    height: 165,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 16, 10, 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'notes'.tr(),
                      ),
                      maxLines: 5,
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: BuyButtonContainer(
              text: 'confirm'.tr(),
              price: 20,
              ontap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PayCheckPage(),
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

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  String text;
  String subtext;
  String image;
  bool arrow;
  void Function()? ontap;
  CustomListTile(
      {super.key,
      required this.text,
      required this.subtext,
      required this.image,
      required this.arrow,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 343,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: arrow
              ? Border.all(
                  width: 1,
                  color: const Color(0xffeeeeee),
                )
              : null,
          color: const Color(0xffffffff),
        ),
        child: ListTile(
          leading: SvgPicture.asset(image),
          title: Text(text),
          subtitle: Text(subtext),
          trailing: arrow ? const Icon(Icons.arrow_forward_ios_rounded) : null,
        ),
      ),
    );
  }
}
