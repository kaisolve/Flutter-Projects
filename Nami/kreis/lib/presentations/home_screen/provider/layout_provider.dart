import 'package:flutter/material.dart';

class LayoutProvider with ChangeNotifier {
  int currentIndex = -1;
  Widget? currentScreen;
  List<Widget> bottomNavigationScreen = [
    // const ChatScreen(),const StatisticsScreen(),const HomeScreen(),const CartScreen(),const ProfileScreen()
  ];
  List<Widget> stack = [];

  void init() {
    currentIndex = 2;
    currentScreen = bottomNavigationScreen[currentIndex];
  }

  void updateSelectedBottomNavigationIndex(int index) {
    currentIndex = index;
    currentScreen = bottomNavigationScreen[currentIndex];

    notifyListeners();
  }

  void onBack() {
    if (stack.isNotEmpty) {
      stack.removeLast();
      currentScreen = stack.last;
      notifyListeners();
    } else {
      if (currentIndex != -1) {
        currentScreen = bottomNavigationScreen.elementAt(currentIndex);
        notifyListeners();
      }
    }
  }
}
