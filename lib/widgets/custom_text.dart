import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool? isTitle;
  final bool? isSmall;
  final bool? isBold;
  final Color? color;
  const CustomText({
    super.key,
    required this.text,
    this.isTitle = false,
    this.isSmall = false,
    this.isBold = false,
    this.color = kTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: isTitle!
            ? kLargeFontSize
            : isSmall!
                ? kSmallFontSize
                : kDefaultFontSize,
        fontWeight: isBold! ? kBoldFontWeight : kDefaultFontWeight,
      ),
    );
  }
}
