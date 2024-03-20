import 'package:flutter/material.dart';
import 'package:kreis/presentation/auth/provider/auth_provider.dart';
import 'package:kreis/presentation/home_screen/bottom_navigation_screens/categories_screen/provider/provider.dart';
import 'package:kreis/presentation/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentation/home_screen/bottom_navigation_screens/home_screen/items_screen/provider/provider.dart';
import 'package:kreis/presentation/home_screen/bottom_navigation_screens/profile_screen/provider/provider.dart';
import 'package:provider/provider.dart';

class AppMultiProvider extends StatelessWidget {
  final Widget child;
  const AppMultiProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ItemsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: child,
    );
  }
}
