import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/app_theme/theme.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/multiprovider.dart';
import 'package:kreis/presentations/splash_screen/splash.dart';

var navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCoyxqkJBQ9hj9dVfzXZMDDBwt5lRhRVtw',
          appId: '1:161099138507:android:7f1c8845127df9708ea24e',
          messagingSenderId: '161099138507',
          projectId: 'kreis-417313',
          storageBucket: 'kreis-417313.appspot.com'));

  await EasyLocalization.ensureInitialized();
  runApp(AppMultiProvider(
    child: EasyLocalization(
        supportedLocales: languages,
        path: 'assets/languages',
        saveLocale: true,
        useOnlyLangCode: true,
        startLocale: const Locale('ar'),
        // useFallbackTranslations: true,
        // fallbackLocale: languages[0],
        child: const MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme(context),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashScreen(),
    );
  }
}
