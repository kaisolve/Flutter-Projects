import 'package:flutter/material.dart';
import 'package:kreis/core/app_style.dart';
import 'package:kreis/presentation/home_page/provider/provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Consumer<HomeProvider>(
          builder:
              (BuildContext context, HomeProvider provider, Widget? child) {
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
                items: [
                  BottomNavigationBarItem(
                    icon: getCustomIcon('assets/images/svgs/home.svg',
                        provider.selectedindex == 0),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: getCustomIcon('assets/images/svgs/categories.svg',
                        provider.selectedindex == 1),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: getCustomIcon('assets/images/svgs/settings.svg',
                        provider.selectedindex == 2),
                    label: '',
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
