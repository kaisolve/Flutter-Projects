import 'package:flutter/material.dart';
import 'package:kreis/presentations/widgets/custom_svg/CustomSvgIcon.dart';

const languages = [Locale('ar'), Locale('en')];

const buttonItems = [
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
];

const appTextStyle = TextStyle(
  color: Color(0xffDF1C26),
  fontSize: 24,
  fontWeight: FontWeight.w400,
);

const String googleMapKey = '';
const String cartKey = 'Cart Key';
const String userKey = 'User';
const String profileKey = 'Is Signed In';
const supportedLanguages = [Locale('ar'), Locale('en')];
const double fontR11 = 11;
const double fontR14 = 14;
const double fontR16 = 16;
const double fontR18 = 18;
const double fontR20 = 20;

//app bar size
const double appBarSize = 60;
