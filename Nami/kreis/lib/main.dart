import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/constents.dart';
import 'package:kreis/multiprovider.dart';
import 'package:kreis/presentation/splash_page/splash.dart';

var navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(AppMultiProvider(
    child: EasyLocalization(
        supportedLocales: languages,
        path: 'assets/languages',
        saveLocale: true,
        useOnlyLangCode: true,
        startLocale: const Locale('ar'),
        child: const MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  void rebuild() {}
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashScreen(),
    );
  }
}
