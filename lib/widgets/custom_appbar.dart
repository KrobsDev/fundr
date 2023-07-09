import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/user_avatar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showLogo;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    this.showLogo = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        child: const UserAvatar(
          image: 'assets/images/onboarding_3.jpg',
        ),
      ),
      title: showLogo!
          ? SvgPicture.asset(
              'assets/images/Logo.svg',
              width: 30,
            )
          : null,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}
