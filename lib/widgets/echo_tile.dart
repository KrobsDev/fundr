import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/user_avatar.dart';

class EchoTile extends StatelessWidget {
  const EchoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      // padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kDarkBlue,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding * 5,
              top: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: const CustomText(
                        text: 'Discussion',
                        isSmall: true,
                        color: kDarkBlue,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 5, maxWidth: 5),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: kWhiteColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text:
                      'Charity Spotlight: Examining the Impact of Donations on Specific Causes',
                  // isMedium: true,
                  color: kWhiteColor,
                  isBold: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Wrap(
                      spacing: -20,
                      children: [
                        UserAvatar(
                          image: 'assets/images/onboarding_1.jpg',
                          radius: 15,
                          hasBorder: true,
                          borderColor: kDarkBlue,
                        ),
                        UserAvatar(
                          image: 'assets/images/onboarding_2.jpg',
                          radius: 15,
                          hasBorder: true,
                          borderColor: kDarkBlue,
                        ),
                        UserAvatar(
                          image: 'assets/images/onboarding_3.jpg',
                          radius: 15,
                          hasBorder: true,
                          borderColor: kDarkBlue,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    CustomText(
                      text: '1.2k listening',
                      isMedium: true,
                      color: kWhiteColor,
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              // padding: EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF015B9E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      UserAvatar(
                        image: 'assets/images/lg_bg.jpg',
                        radius: 15,
                        hasBorder: true,
                      ),
                      SizedBox(width: 10),
                      CustomText(
                        text: 'Dr. Daniel Obimpeh',
                        isMedium: true,
                        color: kWhiteColor,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/voice.svg',
                        width: 30,
                      ),
                      const SizedBox(width: 10),
                      const CustomText(
                        text: 'Tobilola is speaking...',
                        isMedium: true,
                        color: kWhiteColor,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
