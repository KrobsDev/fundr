import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_appbar.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/post_action.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showLogo: true,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
            ),
            title: const Row(
              children: [
                CustomText(
                  text: 'Cristofer Torff',
                ),
                Row(
                  children: [
                    CustomText(
                      text: ' @ctorff',
                      isSmall: true,
                      color: kGreyColor,
                    ),
                    CustomText(text: '•'),
                    CustomText(
                      text: '2m',
                      isSmall: true,
                      color: kGreyColor,
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Column(
              children: [
                const CustomText(
                  text:
                      'Lorem ipsum dolor sit amet consectetur. Dictum pellentesque ac gravida a. Elit hac tortor facilisis leo. Egestas enim convallis sollicitudin arcu enim nibh platea pellentesque. Elementum nullam dolor elementum malesuada pellentesque condimentum.',
                  isMedium: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PostAction(
                        icon: SvgPicture.asset('assets/icons/comment.svg'),
                        count: '143',
                      ),
                      PostAction(
                        icon: SvgPicture.asset('assets/icons/heart.svg'),
                        count: '143',
                      ),
                      PostAction(
                        icon: SvgPicture.asset('assets/icons/repost.svg'),
                        count: '143',
                      ),
                      PostAction(
                        icon: SvgPicture.asset('assets/icons/stats.svg'),
                        count: '143',
                      ),
                      PostAction(
                        icon: SvgPicture.asset('assets/icons/share.svg'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
