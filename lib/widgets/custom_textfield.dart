import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';

class CustomTextFIeld extends StatelessWidget {
  final FocusNode focusNode;
  final bool isFocused;
  final Icon? icon;
  final String hintText;
  final bool? obscureText;

  const CustomTextFIeld({
    super.key,
    required this.focusNode,
    required this.hintText,
    this.isFocused = false,
    this.obscureText = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: obscureText!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: kDefaultFontWeight,
          fontSize: kMediumFontSize,
          color: kTextColor.withOpacity(0.6),
        ),
        suffixIcon: icon ?? const SizedBox(),
        suffixIconColor: isFocused ? kPrimaryColor : kGreyColor,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kGreyColor.withOpacity(0.1)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kGreyColor),
        ),
      ),
    );
  }
}
