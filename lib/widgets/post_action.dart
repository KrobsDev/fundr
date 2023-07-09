import 'package:flutter/material.dart';
import 'package:fundr/widgets/custom_text.dart';

class PostAction extends StatelessWidget {
  final Widget icon;
  final String? count;

  const PostAction({super.key, required this.icon, this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        CustomText(
          text: count ?? '',
          isSmall: true,
          fontWeight: FontWeight.w200,
        ),
      ],
    );
  }
}
