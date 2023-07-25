import 'package:flutter/material.dart';
import 'package:fundr/widgets/custom_text.dart';

class Heading extends StatelessWidget {
  final String primaryText;
  final String? secondaryText;
  const Heading({
    super.key,
    required this.primaryText,
    this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: primaryText,
          isTitle: true,
          isBold: true,
        ),
        CustomText(
          text: secondaryText ?? '',
          isSmall: true,
        ),
      ],
    );
  }
}
