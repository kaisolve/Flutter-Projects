import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/app_theme/theme.dart';
import 'package:kreis/presentations/home_screen/provider/layout_provider.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';

import '../../../../injection.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String iconName;
  final bool selected;
  final int index;

  const CustomBottomNavigationItem(
      {super.key,
      required this.iconName,
      required this.selected,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        LayoutProvider layoutProvider = getIt();
        layoutProvider.updateSelectedBottomNavigationIndex(index);
      },
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: CustomSvgIcon(
        assetName: iconName,
        color: selected
            ? mainColor
            : AppTheme.isDarkMode()
                ? greyColor
                : black,
      ),
    ));
  }
}
