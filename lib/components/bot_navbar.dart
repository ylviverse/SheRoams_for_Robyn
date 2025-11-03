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
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: const Color(0xFF4DB6AC),
              hoverColor: const Color(0xFF80CBC4),
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              tabBackgroundColor: const Color(0xFF009688),
              color: Colors.grey,
              tabs: const [
                GButton(
                  icon: Icons.dashboard,
                  text: 'HOMEPAGE',
                ),
                GButton(
                  icon: CupertinoIcons.car_detailed,
                  text: 'RIDES',
                ),
                GButton(
                  icon: Icons.food_bank,
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