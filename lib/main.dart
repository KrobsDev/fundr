import 'package:flutter/material.dart';
import 'package:fundr/views/homepage.dart';
import 'package:fundr/views/onboarding.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFF004E89)),
        useMaterial3: true,
      ),
      home: const Onboarding(),
    );
  }
}
