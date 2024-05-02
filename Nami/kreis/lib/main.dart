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
          apiKey: 'AIzaSyB7XiRYB4Hj7IKcMz4Mw6AzmlFDY_4dRxw',
          appId: '1:255319230487:android:c40be6bb15bb027fa7f452',
          messagingSenderId: '255319230487',
          projectId: 'kreis-1bc0e',
          storageBucket: 'kreis-1bc0e.appspot.com'));

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
