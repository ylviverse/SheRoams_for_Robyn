import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withValues(alpha: 0.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: GNav(
              rippleColor: const Color(0xFFfe7c67),
              hoverColor: const Color(0xFFffac83),
              gap: 6, 
              activeColor: Colors.black,
              iconSize: 24,
              
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              tabBackgroundColor: const Color(0xFFffc9b3),
              color: Colors.grey,
              tabs: const [
                GButton(
                  icon: Icons.dashboard,
                  text: 'HOME', 
                ),
                GButton(
                  icon: CupertinoIcons.car_detailed,
                  text: 'RIDE',
                ),
                GButton(
                  icon: CupertinoIcons.house_alt_fill,
                  text: 'STAY',
                ),
                GButton(
                  icon: Icons.lunch_dining,
                  text: 'FOOD',
                ),
              ],
              selectedIndex: currentIndex,
              onTabChange: onTap,
            ),
          ),
        ),
      ),
    );
  }
}