import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MoneyAndAtm extends StatelessWidget {
  const MoneyAndAtm({super.key});

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
          'Money and ATMs',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Money & Banking',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Managing money in Bali',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),

          // Subcategories
          _buildCategoryItem(
            context,
            icon: Icons.currency_exchange,
            title: 'Currency Exchange',
            subtitle: 'Checking rates and tips',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.atm,
            title: 'Reliable ATMs',
            subtitle: 'Finding safe ATMs in Bali',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.credit_card,
            title: 'Cards & Payment',
            subtitle: 'Using credit/debit cards',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.account_balance,
            title: 'Banks',
            subtitle: 'Major banks and services',
          ),
          _buildCategoryItem(
            context,
            icon: Icons.payments,
            title: 'ATM Fees',
            subtitle: 'Typical fees and charges',
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
          width: 48, // Add fixed width
          height: 48, // Add fixed height
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.grey[800], size: 24), // Slightly smaller icon to fit
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
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