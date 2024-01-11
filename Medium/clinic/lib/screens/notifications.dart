import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final String pageName;

  NotificationPage(this.pageName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),

    );
  }
}
