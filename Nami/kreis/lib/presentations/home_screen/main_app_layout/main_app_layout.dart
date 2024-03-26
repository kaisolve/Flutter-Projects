import 'package:flutter/material.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/presentations/home_screen/provider/layout_provider.dart';
import 'package:provider/provider.dart';

class MainAppLayout extends StatelessWidget {
  const MainAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(
      builder: (context, value, child) {
        return Consumer<LayoutProvider>(
          builder:
              (BuildContext context, LayoutProvider provider, Widget? child) {
            return Scaffold(
              body: IndexedStack(
                index: provider.selectedindex,
                children: provider.pages,
              ),
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType
                      .fixed, // to be able to add 4 icons and not be whited
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: provider.selectedindex,
                  onTap: (index) {
                    provider.updateSelectedIndex(index);
                  },
                  items: buttonItems),
            );
          },
        );
      },
    );
  }
}
