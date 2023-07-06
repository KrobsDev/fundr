import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/auth/login.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/models/onboarding_model.dart';
import 'package:fundr/widgets/custom_text.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  double _currentPage = 0;
  double currentSweepAngle = 0;
  final double increment = 0.25; // Increment of 25%
  late Animation<double> _animation;
  late AnimationController _animationController;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    // initialise the animation controller
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {
          currentSweepAngle = _animation.value;
        });
      });
  }

  void _goToNextScreen() {
    if (pageController.page == 4) {
      // navigate to the next page (login)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
      return;
    }

    setState(() {
      _currentPage++;
    });

    pageController.animateToPage(
      _currentPage.toInt(),
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  void animateToSweep(double sweepAngle) {
    _animationController.animateTo(sweepAngle);
  }

  @override
  void dispose() {
    // _animationTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _currentPage = value.toDouble();
              });

              animateToSweep(value * increment);
            },
            controller: pageController,
            itemCount: content.length,
            itemBuilder: (context, int index) {
              return Stack(
                children: [
                  // background image
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // gradient
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      gradient: RadialGradient(
                        radius: 3.219,
                        center: Alignment.topLeft,
                        stops: [
                          0.0,
                          0.25,
                          0.8,
                        ],
                        colors: [
                          Color(0xFF000000),
                          Color.fromRGBO(0, 0, 0, 0.25),
                          Color(0xFF000000),
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
              );
            },
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding * 5,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: content[_currentPage.toInt()].title,
                      isTitle: true,
                      isBold: true,
                      color: kWhiteColor,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: content[_currentPage.toInt()].text,
                      color: kWhiteColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 18,
                right: 20,
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Transform.rotate(
                    angle: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: kSecondaryColor,
                      value: _animation.value,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 22,
                child: InkWell(
                  onTap: () {
                    _goToNextScreen();
                  },
                  // Only paint when animation is initialized
                  child: Container(
                    width: 65,
                    height: 65,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 45,
                left: 20,
                child: DotsIndicator(
                  dotsCount: 5,
                  position: _currentPage,
                  onTap: (position) {
                    pageController.animateToPage(
                      position.toInt(),
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                    );
                  },
                  decorator: DotsDecorator(
                    activeColor: kPrimaryColor,
                    spacing: const EdgeInsets.symmetric(horizontal: 3),
                    color: kWhiteColor.withOpacity(0.1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
