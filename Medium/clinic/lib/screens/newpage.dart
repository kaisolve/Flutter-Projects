import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String pageName;

  NewPage(this.pageName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: Center(
        child: Text('This is the $pageName Page'),
      ),
    );
  }
}
