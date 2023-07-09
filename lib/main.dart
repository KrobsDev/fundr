import 'package:flutter/material.dart';
import 'package:fundr/constants.dart';
import 'package:fundr/widgets/custom_bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color(0XFF004E89)).copyWith(
          background: kWhiteColor,
        ),
      ),
      home: const CustomBottomNavigation(),
    );
  }
}
