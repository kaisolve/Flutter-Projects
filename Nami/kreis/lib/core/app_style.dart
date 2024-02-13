import 'package:flutter/material.dart';

ImageIcon getCustomIcon(String asset, String asset2, bool isclicked) {
  return ImageIcon(
    isclicked ? AssetImage(asset2) : AssetImage(asset),
    size: 24.0,
    color: isclicked ? const Color(0xffDF1C26) : Colors.grey,
  );
}
