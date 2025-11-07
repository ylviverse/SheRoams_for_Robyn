import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Colors.grey[400],
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Plan Your Visit',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Best time to visit Bali',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),

          // Subcategories
          _buildCategoryItem(
            context,
            icon: Icons.wb_sunny,
            title: 'Best Season to Visit',
            subtitle: 'April - October: Best weather for beach & outdoor activities',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.cloud,
            title: 'Temperature by Region',
            subtitle: 'November - March: Lush greenery, fewer crowds',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.woman,
            title: 'What to Pack',
            subtitle: 'Year-round tropical climate: 26°C - 32°C',
          ),
          
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.grey[800], size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Add navigation or action
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Viewing details for $title'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}