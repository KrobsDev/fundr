import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/models/post_model.dart';
import 'package:fundr/widgets/custom_appbar.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/custom_textfield.dart';
import 'package:fundr/widgets/heading_item.dart';
import 'package:fundr/widgets/post_item.dart';
import 'package:fundr/widgets/trend_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode searchFNode = FocusNode();
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    searchFNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    searchFNode.removeListener(_onFocusChange);
    searchFNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      hasFocus = searchFNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showSetting: true,
        title: SizedBox(
          height: 30,
          // width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CustomTextField(
                      focusNode: searchFNode,
                      hintText: 'Search Fundr',
                      padding: 0,
                    ),
                    Visibility(
                      visible: !hasFocus,
                      child: Positioned(
                        left: 0,
                        right: 120,
                        top: 0,
                        bottom: 0,
                        child: Transform.scale(
                          scale: .8,
                          child: SvgPicture.asset(
                            'assets/icons/bottom_navigation/search.svg',
                            width: 2.0,
                            height: 2.0,
                            fit: BoxFit.scaleDown,
                            colorFilter: const ColorFilter.mode(
                                kGreyColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: 10),
              child: Heading(
                primaryText: 'Trending Charities',
                secondaryText: 'Find out what is trending around you',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const TrendItem();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Show more',
                    isMedium: true,
                    color: kPrimaryColor,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: kGreyColor.withOpacity(0.2),
                  )
                ],
              ),
            ),
            Divider(
              color: kGreyColor.withOpacity(0.05),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Heading(
                primaryText: 'Charities you follow',
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostItem(
                    userName: posts[index].userName,
                    handle: posts[index].handle,
                    time: posts[index].time,
                    content: posts[index].content,
                    isImage: posts[index].isImage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
