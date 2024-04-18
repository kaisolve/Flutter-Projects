import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kreis/core/app_colors/app_colors.dart';
import 'package:kreis/core/app_theme/theme.dart';
import 'package:kreis/core/text_styles/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final InputBorder? border;
  final Color color;
  final void Function(String)? onchanged;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.hint,
      this.prefix,
      this.suffix,
      this.textInputType = TextInputType.text,
      this.border,
      this.color = input2Bg,
      this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: containerBorder, width: 1),
          color: color,
          borderRadius: BorderRadius.circular(16)),
      child: TextFormField(
        controller: controller,
        onChanged: onchanged,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: mainColor,
        style: AppTextStyles().normalText().textColorNormal(
            AppTheme.isDarkMode() ? Colors.white : Colors.black),
        keyboardType: textInputType,
        maxLength: textInputType == TextInputType.phone ? 11 : null,
        inputFormatters: textInputType == TextInputType.phone
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        decoration: InputDecoration(
          border: border ?? InputBorder.none,
          hintText: hint,
          hintStyle: AppTextStyles().normalText().textColorNormal(hintColor),
          suffixIcon: suffix,
          prefixIcon: prefix,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 24, maxWidth: 64, minWidth: 45),
          counterText: '',
        ),
      ),
    );
  }
}
