import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_button.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // function to handle the focus change
  void _handleFocusChange() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_handleFocusChange);
    _passwordFocusNode.removeListener(_handleFocusChange);
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(),
                image: const DecorationImage(
                  image: AssetImage('assets/images/lg_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0.0,
                          1,
                        ],
                        colors: [
                          kDarkBg.withOpacity(0.72),
                          kDarkBg,
                        ],
                      ),
                    ),
                  ),

                  const Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            text: 'Your impact starts here. Sign in now!',
                            color: kWhiteColor,
                            isTitle: true,
                            isBold: true,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: 'Connect. Collaborate. Change the world.',
                            color: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // logo
                  Positioned(
                    top: 50,
                    left: 20,
                    child: SvgPicture.asset(
                      'assets/images/Logo.svg',
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFIeld(
                    focusNode: _emailFocusNode,
                    isFocused: _emailFocusNode.hasFocus,
                    hintText: 'Email',
                    icon: const Icon(
                      Icons.mail_outline_rounded,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFIeld(
                    focusNode: _passwordFocusNode,
                    isFocused: _passwordFocusNode.hasFocus,
                    hintText: 'Password',
                    icon: const Icon(Icons.lock_outlined),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        shape:
                            MaterialStatePropertyAll(RoundedRectangleBorder()),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const CustomText(
                        text: 'Forgot password?',
                        isSmall: true,
                        isMedium: true,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: 'Sign in',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(
                          color: kGreyColor.withOpacity(0.2),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CustomText(
                          text: 'or continue with',
                          isSmall: true,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: kGreyColor.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2,
                              vertical: kDefaultPadding / 1.5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: kGreyColor.withOpacity(0.075)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/google.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              const CustomText(
                                text: 'Sign in with Google',
                                isSmall: true,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2,
                              vertical: kDefaultPadding / 1.5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: kGreyColor.withOpacity(0.075)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/apple.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              const CustomText(
                                text: 'Sign in with Google',
                                isSmall: true,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                              color: kTextColor,
                              fontWeight: kDefaultFontWeight,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: ' Sign up',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
