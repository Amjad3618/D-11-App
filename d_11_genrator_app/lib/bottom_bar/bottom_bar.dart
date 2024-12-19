import 'package:d_11_genrator_app/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:d_11_genrator_app/screens/add_cut_of.dart';
import 'package:d_11_genrator_app/screens/home_screen.dart';
import 'package:d_11_genrator_app/screens/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  
  static final List<Widget> _screens = [
    const HomeScreen(),
    const AddAnotherCutOff(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: btncolor,
        buttonBackgroundColor: Colors.black,
        height: 60,
        animationDuration: const Duration(milliseconds: 300),
        index: _selectedIndex,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}