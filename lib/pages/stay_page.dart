import 'package:flutter/material.dart';

class StayPage extends StatelessWidget {
  const StayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels & Stays'),
        backgroundColor: const Color(0xFFefa355),
      ),
      body: const Center(
        child: Text('Stay Page Content'),
      ),
    );
  }
}