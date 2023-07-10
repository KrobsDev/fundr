import 'package:flutter/material.dart';
import 'package:fundr/widgets/custom_text.dart';

class PostAction extends StatelessWidget {
  final Widget icon;
  final String? count;
  final bool? tapFeedback;
  final Function()? onTap;

  const PostAction({
    super.key,
    required this.icon,
    this.count,
    this.onTap,
    this.tapFeedback = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget actionContent = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 5),
        CustomText(
          text: count ?? '',
          isSmall: true,
          fontWeight: FontWeight.w200,
        ),
      ],
    );

    if (tapFeedback == true) {
      return InkWell(
        onTap: onTap,
        child: actionContent,
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: actionContent,
      );
    }
  }
}
