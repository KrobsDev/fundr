import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_button.dart';
import 'package:fundr/widgets/custom_text.dart';
import 'package:fundr/widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode _fNameFocusNode = FocusNode();
  final FocusNode _lNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // function to handle the focus change
  void _handleFocusChange() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fNameFocusNode.addListener(_handleFocusChange);
    _lNameFocusNode.addListener(_handleFocusChange);
    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _fNameFocusNode.removeListener(_handleFocusChange);
    _lNameFocusNode.removeListener(_handleFocusChange);
    _emailFocusNode.removeListener(_handleFocusChange);
    _passwordFocusNode.removeListener(_handleFocusChange);
    _fNameFocusNode.dispose();
    _lNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
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
                            text:
                                'Join us in making a difference. Sign up now!',
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
                    focusNode: _fNameFocusNode,
                    isFocused: _fNameFocusNode.hasFocus,
                    hintText: 'First name',
                    icon: const Icon(
                      Icons.face_5_rounded,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFIeld(
                    focusNode: _lNameFocusNode,
                    isFocused: _lNameFocusNode.hasFocus,
                    hintText: 'Last name',
                    icon: const Icon(Icons.face_5_rounded),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: 'Create account',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: kTextColor,
                              fontWeight: kDefaultFontWeight,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pop();
                              },
                            text: ' Sign in',
                            style: const TextStyle(
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
