import 'package:flutter/material.dart';
import 'package:kreis/presentation/category_page/provider/provider.dart';
import 'package:kreis/presentation/home_page/provider/provider.dart';
import 'package:kreis/presentation/items_page/provider/provider.dart';
import 'package:kreis/presentation/profile_page/provider/provider.dart';
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
      ],
      child: child,
    );
  }
}
