import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_appbar.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/user_avatar.dart';

import '../../widgets/message_tile.dart';

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
            return MessageTile(
              image: 'assets/images/onboarding_1.jpg',
              name: 'Martin Channing',
              message: 'Mentioned you in a post by CharCharity',
              time: '2 min ago',
            );
          },
        ));
  }
}
