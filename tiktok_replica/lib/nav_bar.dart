import 'package:flutter/material.dart';

import 'screens/main_screens/home_screen.dart';
import 'screens/main_screens/profile.dart';
import 'screens/main_screens/camera.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedPage = 0;
  final _pageOptions = [
    HomeScreen(),
    CameraScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined, size: 30),
              label: 'Add Video',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined, size: 30),
              label: 'Account',
            ),
          ],
          selectedItemColor: Colors.white,
          elevation: 5.0,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedPage,
          backgroundColor: Colors.black,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
