import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_text.dart';

class TrendItem extends StatelessWidget {
  const TrendItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kDarkBg,
        ),
      ),
      title: const CustomText(
        text: 'Trending in Ghana',
        isSmall: true,
        color: kGreyColor,
      ),
      subtitle: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Save the children',
            isMedium: true,
            fontWeight: kMediumFontWeight,
          ),
          CustomText(
            text: '21.4k posts',
            isSmall: true,
            color: kGreyColor,
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        visualDensity: VisualDensity.compact,
        icon: Icon(
          Icons.more_horiz,
          size: 20,
          color: kGreyColor.withOpacity(0.2),
        ),
      ),
    );
  }
}
