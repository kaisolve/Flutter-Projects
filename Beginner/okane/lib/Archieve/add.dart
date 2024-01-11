import 'package:flutter/material.dart';

import '../screens/home.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              'Food With Icon',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Home.id);
          },
          child: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
