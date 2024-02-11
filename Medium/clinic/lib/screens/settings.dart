import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final String pageName;

  const SettingPage(this.pageName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
    );
  }
}
