import 'package:flutter/material.dart';

class Buble extends StatelessWidget {
  const Buble({super.key, required this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 15),
      child: Container(
        // padding: const EdgeInsets.only(),
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
