import 'package:flutter/material.dart';

class DriverPage extends StatelessWidget {
  const DriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    // No Scaffold or BottomNavBar needed here either
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Drivers'),
        backgroundColor: const Color(0xFFefa355),
      ),
      body: const Center(
        child: Text('Drive Page Content'),
      ),
    );
  }
}