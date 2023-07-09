import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String image;
  const UserAvatar({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(image),
    );
  }
}
