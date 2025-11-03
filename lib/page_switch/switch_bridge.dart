import 'package:flutter/material.dart';
import 'package:she_roams_bali/components/bot_navbar.dart';
import 'package:she_roams_bali/pages/Homepage.dart';
import 'package:she_roams_bali/pages/driver_page.dart';
import 'package:she_roams_bali/pages/food_page.dart';
import 'package:she_roams_bali/pages/stay_page.dart'; 




//handles the switching between main pages using bottom navigation bar so that the state of each page is preserved
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;


  final List<Widget> _pages = [
    const Homepage(),
    const DriverPage(),
    const StayPage(), 
    const FoodPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
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