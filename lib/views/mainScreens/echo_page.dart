import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_appbar.dart';
import 'package:fundr/widgets/custom_textfield.dart';
import 'package:fundr/widgets/echo_tile.dart';
import 'package:fundr/widgets/heading_item.dart';

class EchoPage extends StatefulWidget {
  const EchoPage({super.key});

  @override
  State<EchoPage> createState() => _EchoPageState();
}

class _EchoPageState extends State<EchoPage> {
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
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading(
                primaryText: 'Happening Now',
                secondaryText: 'Interesting discussions going on right now',
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const EchoTile();
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
