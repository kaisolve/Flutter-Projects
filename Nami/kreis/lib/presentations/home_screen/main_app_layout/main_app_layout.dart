import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/provider/layout_provider.dart';
import 'package:kreis/presentations/home_screen/main_app_layout/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';

class MainAppLayout extends StatefulWidget {
  const MainAppLayout({super.key});

  @override
  State<MainAppLayout> createState() => _MainAppLayoutState();
}

class _MainAppLayoutState extends State<MainAppLayout> {
  LayoutProvider provider = getIt();
  @override
  void initState() {
    super.initState();
    provider.init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(builder: (context, provider, _) {
      return Column(
        children: [
          Expanded(child: provider.currentScreen ?? const SizedBox()),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: const CustomBottomNavigation(),
          )
        ],
      );
    });
  }
}
