import 'package:flutter/material.dart';
import 'package:kreis/core/app_style.dart';
import 'package:kreis/core/constents.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => buttons(),
        child: Consumer<buttons>(
          builder: (context, value, child) {
            return Scaffold(
              body: PageView(
                  controller: _pageController,
                  children: pages,
                  onPageChanged: (index) => value.changeindex(index)),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType
                    .fixed, // to be able to add 4 icons and not be whited
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: value._currentIndex,
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
                        value._currentIndex == 0),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: getCustomIcon(
                        'assets/images/icons/category.png',
                        'assets/images/icons/category2.png',
                        value._currentIndex == 1),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: getCustomIcon(
                        'assets/images/icons/map-marker.png',
                        'assets/images/icons/map-marker2.png',
                        value._currentIndex == 2),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: getCustomIcon(
                        'assets/images/icons/settings.png',
                        'assets/images/icons/settings2.png',
                        value._currentIndex == 3),
                    label: '',
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class buttons extends ChangeNotifier {
  int _currentIndex = 0;
  void changeindex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
