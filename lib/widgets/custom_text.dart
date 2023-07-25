import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool? isTitle;
  final bool? isSmall;
  final bool? isMedium;
  final bool? isBold;
  final Color? color;
  final int? maxLines;
  final bool? isMessage;
  final FontWeight? fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.isTitle = false,
    this.isSmall = false,
    this.isMedium = false,
    this.isMessage = false,
    this.isBold = false,
    this.color = kTextColor,
    this.maxLines,
    this.fontWeight = kDefaultFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        overflow: isMessage! ? TextOverflow.ellipsis : null,
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
