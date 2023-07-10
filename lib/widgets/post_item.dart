import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/post_action.dart';

class PostItem extends StatelessWidget {
  final String userName;
  final String handle;
  final String time;
  final bool? isImage;
  final String content;

  const PostItem({
    super.key,
    required this.userName,
    required this.handle,
    required this.time,
    required this.content,
    this.isImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: const CircleAvatar(
        backgroundColor: Colors.red,
      ),
      title: Row(
        children: [
          CustomText(
            text: userName,
            isMedium: true,
          ),
          Row(
            children: [
              CustomText(
                text: ' @$handle',
                isSmall: true,
                color: kGreyColor,
              ),
              const CustomText(text: '•'),
              CustomText(
                text: time,
                isSmall: true,
                color: kGreyColor,
              ),
            ],
          ),
        ],
      ),
      subtitle: Column(
        children: [
          isImage!
              ? Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      image: AssetImage(
                        content,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : CustomText(
                  text: content,
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
                  onTap: () => print('fish'),
                ),
                PostAction(
                  icon: SvgPicture.asset('assets/icons/inactive/heart.svg'),
                  count: '143',
                  onTap: () {},
                  tapFeedback: true,
                ),
                PostAction(
                  icon: SvgPicture.asset('assets/icons/inactive/repost.svg'),
                  count: '143',
                  onTap: () {},
                ),
                PostAction(
                  icon: SvgPicture.asset('assets/icons/stats.svg'),
                  count: '143',
                ),
                PostAction(
                  icon: SvgPicture.asset('assets/icons/share.svg'),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
