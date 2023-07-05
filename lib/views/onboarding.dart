import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  double _currentSweepAngle = 0;
  final double maxSweepAngle = math.pi * 2; // Full circle
  final double increment = 0.2; // Increment of 20%
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
  }

  void _incrementSweepAngle() {
    setState(() {
      _currentSweepAngle += increment;

      if (_currentSweepAngle > maxSweepAngle) {
        _currentSweepAngle = maxSweepAngle;
      }
    });
  }

  @override
  void dispose() {
    // _animationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
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
                          value: _currentSweepAngle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 52,
                    right: 22,
                    child: InkWell(
                      onTap: () {
                        _incrementSweepAngle();
                      },
                      // Only paint when animation is initialized
                      child: Container(
                        width: 65,
                        height: 65,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
