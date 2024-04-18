import 'package:flutter/material.dart';
import 'package:kreis/presentations/home_screen/provider/layout_provider.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:provider/provider.dart';

class MainAppLayout extends StatefulWidget {
  const MainAppLayout({super.key});

  @override
  State<MainAppLayout> createState() => _MainAppLayoutState();
}

class _MainAppLayoutState extends State<MainAppLayout> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    // });
  }

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
                  items: [
                    BottomNavigationBarItem(
                      icon: CustomSvgIcon(
                        assetName:
                            provider.selectedindex == 0 ? 'home2' : 'home',
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: CustomSvgIcon(
                        assetName: provider.selectedindex == 1
                            ? 'categories2'
                            : 'categories',
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: CustomSvgIcon(
                        assetName: provider.selectedindex == 2
                            ? 'settings2'
                            : 'settings',
                      ),
                      label: '',
                    ),
                  ]),
            );
          },
        );
      },
    );
  }
}
