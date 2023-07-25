import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/user_avatar.dart';

class NotificationTile extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final String time;

  const NotificationTile({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          UserAvatar(
            image: image,
            radius: 25,
          ),
          Positioned(
            child: Icon(
              Icons.circle,
              color: kPrimaryColor,
              size: 13,
            ),
          )
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: name,
            fontWeight: kMediumFontWeight,
            isMedium: true,
          ),
          CustomText(
            text: time,
            isSmall: true,
            color: kGreyColor,
          )
        ],
      ),
      subtitle: CustomText(
        text: message,
        isMedium: true,
      ),
    );
  }
}
