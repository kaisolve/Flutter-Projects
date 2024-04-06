import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRichText extends StatelessWidget {
  List<InlineSpan>? children;
  CustomRichText({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(children: children));
  }
}
