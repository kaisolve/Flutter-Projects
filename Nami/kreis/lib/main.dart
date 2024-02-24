import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/constents.dart';
import 'package:kreis/multiprovider.dart';
import 'package:kreis/presentation/splash_page/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(AppMultiProvider(
    child: EasyLocalization(
        supportedLocales: languages,
        path: 'assets/languages',
        // fallbackLocale: Locale('ar', 'EG'),
        startLocale: const Locale('ar'),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashScreen(),
    );
  }
}
