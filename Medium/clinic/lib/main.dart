import 'package:clinic/screens/home.dart';
import 'package:clinic/screens/logo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clinico',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const StartPage(),
          '/home': (context) => HomePage(),
        });
  }
}
