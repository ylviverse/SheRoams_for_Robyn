import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Your Name", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), ),
            accountEmail: Text("your.email@example.com", style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, size: 50, color: Colors.black),
            ),
            decoration: BoxDecoration(color: Color(0xFFffcad4)),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Profile'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}