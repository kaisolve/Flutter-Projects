import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/apptheme.dart';
import '../widgets/themeprovider.dart';

class ThemeSelectionPage extends StatelessWidget {
  static String id = "themes";
  const ThemeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose App Theme'),
      ),
      body: ListView(
        children: [
          RadioListTile(
            title: const Text('Light Mode'),
            value: AppThemes.lightTheme,
            groupValue: themeProvider.themeData,
            onChanged: (value) {
              themeProvider.themeData = value!;
            },
          ),
          RadioListTile(
            title: const Text('Dark Mode'),
            value: AppThemes.darkTheme,
            groupValue: themeProvider.themeData,
            onChanged: (value) {
              themeProvider.themeData = value!;
            },
          ),
          // Add more theme options as needed
        ],
      ),
    );
  }
}
