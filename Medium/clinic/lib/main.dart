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
        scaffoldBackgroundColor: Color(0xFFE9FCFA), // Set background color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Color(0xFF2DACA3), // Set secondary color for buttons
            foregroundColor:
                Colors.white, // Set text color inside buttons to white
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Set text color to white
          bodyMedium: TextStyle(color: Colors.black), // Set text color to white
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
