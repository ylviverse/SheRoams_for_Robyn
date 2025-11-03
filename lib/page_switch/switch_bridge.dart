import 'package:flutter/material.dart';
import 'package:she_roams_bali/components/bot_navbar.dart';
import 'package:she_roams_bali/pages/Homepage.dart';
import 'package:she_roams_bali/pages/driver_page.dart';
import 'package:she_roams_bali/pages/food_page.dart';
import 'package:she_roams_bali/pages/stay_page.dart'; 

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

      // The drawer for navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Your Name"),
              accountEmail: Text("your.email@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("Y", style: TextStyle(fontSize: 40.0, color: Color(0xFF009688))),
              ),
              decoration: BoxDecoration(color: Color(0xFF009688)),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),







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