import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kadai/models/category_data.dart';
import 'package:kadai/screens/account.dart';
import 'package:kadai/screens/calendar.dart';
import 'package:kadai/screens/home.dart';
import 'package:kadai/screens/setting.dart';
import 'package:kadai/screens/startasks.dart';
import 'package:kadai/screens/task.dart';
import 'package:kadai/screens/themes.dart';
import 'package:kadai/widgets/addtask.dart';
import 'package:kadai/widgets/apptheme.dart';
import 'package:kadai/widgets/themeprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("category_database");
  runApp(
    ChangeNotifierProvider(
      create: (_) => CategoryData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(AppThemes.lightTheme),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.themeData,
            initialRoute: Home.id,
            routes: {
              Home.id: (context) => const Home(),
              AddTask.id: (context) => const AddTask(),
              Calendar.id: (context) => const Calendar(
                  // cate',
                  ),
              Tasks.id: (context) => const Tasks(),
              Stars.id: (context) => const Stars(),
              Settings.id: (context) => const Settings(),
              Account.id: (context) => const Account(),
              ThemeSelectionPage.id: (context) => const ThemeSelectionPage(),
            },
          );
        },
      ),
    );
  }
}
