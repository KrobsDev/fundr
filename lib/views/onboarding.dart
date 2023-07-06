import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/constants.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  double _currentPage = 0;
  double _currentSweepAngle = 0;
  final double increment = 0.25; // Increment of 25%
  late Animation<double> _animation;
  late AnimationController _animationController;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // initialise the animation controller
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {
          _currentSweepAngle = _animation.value;
        });
      });
  }

  void _goToNextScreen() {
    if (pageController.page == 4) {
      // navigate to the next page (login)
      return;
    }
    // print(_currentPage);

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

              // if (_currentPage <= pageController.page!) {
              //   animateToSweep(value * increment);
              //   return;
              // }
              animateToSweep(value * increment);
            },
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, int index) {
              return Stack(
                children: [
                  // background image
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/onboarding_1.jpg'),
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
                          0.7,
                        ],
                        colors: [
                          Color(0xFF212121),
                          Color.fromRGBO(0, 0, 0, 0.25),
                          Color(0xFF212121),
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

                  // logo
                ],
              );
            },
          ),
          Stack(
            children: [
              Positioned(
                bottom: 50,
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
                bottom: 52,
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
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
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
                  decorator: const DotsDecorator(
                    activeColor: kPrimaryColor,
                    spacing: EdgeInsets.symmetric(horizontal: 3),
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
