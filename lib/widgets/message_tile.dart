import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/user_avatar.dart';

class MessageTile extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final String time;
  final bool? isMessage;

  const MessageTile({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    this.isMessage = false,
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
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: isMessage! ? 250 : null,
            child: CustomText(
              text: message,
              isMedium: true,
              maxLines: isMessage! ? 1 : null,
              isMessage: isMessage,
            ),
          ),
          isMessage!
              ? Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CustomText(
                    text: '2',
                    fontWeight: kMediumFontWeight,
                    isSmall: true,
                    color: kWhiteColor,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
