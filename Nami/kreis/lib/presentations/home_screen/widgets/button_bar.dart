import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/bottom_navigation_screens/home_screen/provider/provider.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
                items: const [
                  BottomNavigationBarItem(
                    icon: CustomSvgIcon(assetName: 'home'),
                    // getCustomIcon('assets/images/svgs/home.svg',
                    //     provider.selectedindex == 0),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomSvgIcon(assetName: 'categories'),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomSvgIcon(assetName: 'settings'),
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
