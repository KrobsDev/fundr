import 'package:flutter/material.dart';
import 'package:fundr/auth/login.dart';
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
      home: const Login(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Circle Progress Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   double _progress = 0.0;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: Duration(seconds: 1),
//       vsync: this,
//     );

//     _animation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(_controller)
//       ..addListener(() {
//         setState(() {
//           _progress = _animation.value;
//         });
//       });

//     // Start the animation
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void incrementProgress() {
//     _controller.forward();
//     final double newProgress = _progress + 0.2;
//     if (newProgress <= 1.0) {
//       _controller.animateTo(newProgress);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Circle Progress Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(
//               value: _progress,
//             ),
//             SizedBox(height: 16.0),
//             FloatingActionButton(
//               onPressed: incrementProgress,
//               child: Text('Increment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
