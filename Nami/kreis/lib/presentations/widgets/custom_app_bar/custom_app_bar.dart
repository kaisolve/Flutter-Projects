import 'package:flutter/material.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/app_theme/theme.dart';
import 'package:kreis/core/constants/constants.dart';
import 'package:kreis/core/dimens/dimens.dart';
import 'package:kreis/presentations/widgets/custom_text/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Text? homeText;
  final double? fontSize;
  final Color? fontColor;
  final bool? showBackArrow;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showToolBar;
  final double? elevation;
  final Color? bgColor;

  const CustomAppBar(
      {super.key,
      this.title,
      this.homeText,
      this.fontSize = fontR18,
      this.fontColor = black,
      this.showBackArrow = true,
      this.centerTitle = false,
      this.actions,
      this.leading,
      this.showToolBar = true,
      this.elevation,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      elevation: elevation,
      backgroundColor:
          bgColor ?? (AppTheme.isDarkMode() ? Colors.black : white),
      title: leading == null
          ? CustomText(
              title: title ?? '',
              fontSize: fontSize ?? fontR18,
              fontColor: fontColor != null
                  ? (AppTheme.isDarkMode() ? Colors.white : black)
                  : Colors.white,
              fontWeight: FontWeight.normal,
            )
          : homeText,
      leadingWidth: 28,
      automaticallyImplyLeading: showBackArrow ?? false,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size(Dimens.width, showToolBar == true ? appBarSize : 0);
}
