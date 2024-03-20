import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/app_theme/theme.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/dimens/dimens.dart';
import 'package:kreis/presentation/widgets/custom_text/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? fontSize;
  final Color? fontColor;
  final bool? showBackArrow;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool showToolBar;
  final double? elevation;
  final Color? bgColor;

  const CustomAppBar(
      {super.key,
      this.title,
      this.fontSize = fontR14,
      this.fontColor = black,
      this.showBackArrow = false,
      this.centerTitle = true,
      this.actions,
      this.showToolBar = false,
      this.elevation,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor:
          bgColor ?? (AppTheme.isDarkMode() ? Colors.black : white),
      title: CustomText(
        title: title ?? '',
        fontSize: fontSize ?? fontR14,
        fontColor: fontColor != null
            ? (AppTheme.isDarkMode() ? Colors.white : black)
            : Colors.white,
        fontWeight: FontWeight.bold,
      ),
      leadingWidth: 24,
      automaticallyImplyLeading: showBackArrow ?? false,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size(Dimens.width, showToolBar == true ? appBarSize : 0);
}