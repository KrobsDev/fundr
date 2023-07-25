import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';

class UserAvatar extends StatelessWidget {
  final String image;
  final double? radius;
  final bool? hasBorder;
  final Color? borderColor;
  const UserAvatar({
    required this.image,
    this.radius,
    this.hasBorder = false,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: borderColor ?? kWhiteColor,
      child: CircleAvatar(
        radius: hasBorder! ? radius! / 1.15 : radius,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
