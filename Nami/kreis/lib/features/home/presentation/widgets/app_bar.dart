import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String page;
  final bool arrow;
  const Appbar({super.key, required this.page, required this.arrow});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(page),
      automaticallyImplyLeading: arrow,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}