import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VisaRequirement extends StatelessWidget {
  const VisaRequirement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        toolbarHeight: 50,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Visa & Entry',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Entry Requirements',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Visa options for visiting Bali',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),

          // Subcategories
          _buildCategoryItem(
            context,
            icon: Icons.assignment,
            title: 'Visa on Arrival (VOA)',
            //subtitle: '',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.flight_land,
            title: 'Tourism Task',
            //subtitle: '30 days for eligible countries, non-extendable',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.phone_android,
            title: 'E-Visa',
            //subtitle: 'Apply online before arrival for convenience',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.update,
            title: 'Extension Process',
            //subtitle: 'How to extend your stay in Bali',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.description,
            title: 'Required Documents',
            //subtitle: 'Passport, return tickets, proof of accommodation',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.payments,
            title: 'Visa Fees',
            //subtitle: 'Current visa costs and payment methods',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    
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
        //subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
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