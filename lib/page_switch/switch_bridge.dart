import 'package:flutter/material.dart';
import 'package:she_roams_bali/components/bot_navbar.dart';
import 'package:she_roams_bali/pages/Homepage.dart';
import 'package:she_roams_bali/pages/driver_page.dart';
import 'package:she_roams_bali/pages/food_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // List of pages to be displayed
  final List<Widget> _pages = [
    const Homepage(),
    const RidesPage(),
    const FoodPage(),
  ];

  // Callback function for the bottom nav bar
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use IndexedStack to keep the state of each page alive
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}