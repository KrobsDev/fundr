import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_textfield.dart';
import 'package:fundr/widgets/user_avatar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final bool? showLogo;
  final List<Widget>? actions;
  final Widget title;
  const CustomAppBar({
    super.key,
    required this.title,
    // this.showLogo = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const Padding(
        padding: EdgeInsets.only(left: kDefaultPadding),
        child: UserAvatar(
          image: 'assets/images/onboarding_3.jpg',
        ),
      ),
      title: title,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}


// title: showLogo!
//           ? SvgPicture.asset(
//               'assets/images/Logo.svg',
//               width: 30,
//             )
//           : SizedBox(
//               height: 30,
//               child: CustomTextField(
//                 hintText: 'Search',
//                 padding: 0,
//               ),
//             ),