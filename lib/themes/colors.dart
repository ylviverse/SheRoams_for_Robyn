import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFF6B9D);
  static const Color secondaryColor = Color(0xFFFF8FA3);
  static const Color backgroundColor = Colors.white;
  
  // Gradient for homepage
  static const LinearGradient homeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
     
      Color(0xFFFF6B9D),
    ],
   
  );
}