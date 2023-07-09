import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundr/views/mainScreens/echo_page.dart';
import 'package:fundr/views/mainScreens/homepage.dart';
import 'package:fundr/views/mainScreens/messages_page.dart';
import 'package:fundr/views/mainScreens/notifications_page.dart';
import 'package:fundr/views/mainScreens/search_page.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  final List<Widget> screens = const [
    HomePage(),
    SearchPage(),
    EchoPage(),
    NotificationPage(),
    MessagesPage(),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: _currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/bottom_navigation/home.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_navigation/home_active.svg',
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/bottom_navigation/search.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_navigation/search_active.svg',
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/icons/bottom_navigation/microphone.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_navigation/microphone_active.svg',
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/bottom_navigation/bell.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_navigation/bell_active.svg',
            ),
          ),
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset('assets/icons/bottom_navigation/envelope.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_navigation/envelope_active.svg',
            ),
          ),
        ],
      ),
      body: screens[_currentPage],
    );
  }
}
