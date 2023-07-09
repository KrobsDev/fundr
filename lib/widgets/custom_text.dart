import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool? isTitle;
  final bool? isSmall;
  final bool? isMedium;
  final bool? isBold;
  final Color? color;
  final FontWeight? fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.isTitle = false,
    this.isSmall = false,
    this.isMedium = false,
    this.isBold = false,
    this.color = kTextColor,
    this.fontWeight = kDefaultFontWeight,
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
                : isMedium!
                    ? kMediumFontSize
                    : kDefaultFontSize,
        fontWeight:
            isBold! ? kBoldFontWeight : fontWeight ?? kDefaultFontWeight,
      ),
    );
  }
}
