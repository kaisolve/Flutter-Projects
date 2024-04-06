// import 'package:flutter/material.dart';
// import 'package:kreis/injection.dart';
// import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/items_screen/provider/provider.dart';
// import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
// import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';
// import 'package:provider/provider.dart';

// // ignore: must_be_immutable
// class AddMinusItems extends StatefulWidget {
//   final int itemId;

//   const AddMinusItems({super.key, required this.itemId});

//   @override
//   State<AddMinusItems> createState() => _AddMinusItemsState();
// }

// class _AddMinusItemsState extends State<AddMinusItems> {
//   ItemsProvider itemsProvider = getIt();
//   @override
//   void initState() {
//     super.initState();
//     itemsProvider.setItem(widget.itemId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ItemsProvider>(builder: (context, provider, _) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: GestureDetector(
//               onTap: () => provider.updateQuantity(1),
//               child: const CustomSvgIcon(
//                 assetName: 'minus',
//                 width: 16,
//                 height: 3.5,
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
//             height: 48,
//             width: 199,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Center(
//               child: CustomText(
//                 title: provider.quantity.toString(),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: GestureDetector(
//               onTap: () => provider.updateQuantity(-1),
//               child: const CustomSvgIcon(
//                 assetName: 'add',
//               ),
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }
