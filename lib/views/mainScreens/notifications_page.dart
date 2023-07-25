import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_appbar.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/user_avatar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          showSetting: true,
          title: CustomText(
            text: 'Notifications',
            fontWeight: kMediumFontWeight,
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const ListTile(
              leading: Stack(
                children: [
                  UserAvatar(
                    image: 'assets/images/onboarding_1.jpg',
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
                    text: 'Martin Channing',
                    fontWeight: kMediumFontWeight,
                    isMedium: true,
                  ),
                  CustomText(
                    text: '2 min ago',
                    isSmall: true,
                    color: kGreyColor,
                  )
                ],
              ),
              subtitle: CustomText(
                text: 'Mentioned you in a post by CharCharity',
                isMedium: true,
              ),
            );
          },
        ));
  }
}
