import 'package:flutter/material.dart';
import 'package:kreis/core/app_style.dart';
import 'package:kreis/features/categories/presentation/pages/categories.dart';
import 'package:kreis/features/home/presentation/pages/home.dart';
import 'package:kreis/features/settings/presentation/pages/settings.dart';
import 'package:kreis/features/maps/presentation/pages/map.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomePage(),
          CategoryPage(),
          MapPage(),
          SettingPage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // to be able to add 4 icons and not be whited
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: getCustomIcon(
                'assets/images/icons/home.png',
                'assets/images/icons/home2.png',
                _currentIndex == 0 ? true : false),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: getCustomIcon(
                'assets/images/icons/category.png',
                'assets/images/icons/category2.png',
                _currentIndex == 1 ? true : false),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: getCustomIcon(
                'assets/images/icons/map-marker.png',
                'assets/images/icons/map-marker2.png',
                _currentIndex == 2 ? true : false),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: getCustomIcon(
                'assets/images/icons/settings.png',
                'assets/images/icons/settings2.png',
                _currentIndex == 3 ? true : false),
            label: '',
          ),
        ],
      ),
    );
  }
}
