import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final String pageName;

  SettingPage(this.pageName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),

    );
  }
}
