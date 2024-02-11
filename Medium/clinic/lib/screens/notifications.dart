import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final String pageName;

  const NotificationPage(this.pageName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
    );
  }
}
