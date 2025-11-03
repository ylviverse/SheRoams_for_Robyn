import 'package:flutter/material.dart';
import 'package:she_roams_bali/frontpages/frontpage.dart';

void main() {
  runApp(const SheBali());
}

class SheBali extends StatelessWidget {
  const SheBali({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrontPage(),
    );
  }
}


