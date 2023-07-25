import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  // final bool isFocused;
  final bool? isRegular;
  final Widget? icon;
  final Widget? prefixIcon;
  final String hintText;
  final bool? obscureText;
  final double? padding;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.focusNode,
    // this.isFocused = false,
    this.isRegular = false,
    this.obscureText = false,
    this.icon,
    this.prefixIcon,
    this.padding = 15,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: isRegular!
          ? TextAlign.start
          : focusNode!.hasFocus
              ? TextAlign.start
              : TextAlign.center,
      focusNode: focusNode,
      obscureText: obscureText!,
      cursorHeight: isRegular! ? null : 15,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: padding!, horizontal: 15),
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: kDefaultFontWeight,
          fontSize: kMediumFontSize,
          color: kTextColor.withOpacity(0.6),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: icon,
        suffixIconColor: focusNode!.hasFocus ? kPrimaryColor : kGreyColor,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: kGreyColor.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: kGreyColor),
        ),
      ),
    );
  }
}
