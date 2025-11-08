import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CultureHeritage extends StatelessWidget {
  const CultureHeritage({super.key});

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
          'Culture & Heritage',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
        

            // Categories Grid
            Row(
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                
                  
              
              ],
            ),
            const SizedBox(height: 16),

            // Grid of cultural categories
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
              children: [
                _buildCategoryCard(
                  icon: Icons.theater_comedy,
                  label: 'Dance',
                  color: const Color(0xFFF7A5A5),
                ),
                _buildCategoryCard(
                  icon: Icons.music_note,
                  label: 'Music',
                  color: const Color(0xFFF7A5A5),
                ),
                _buildCategoryCard(
                  icon: Icons.temple_hindu,
                  label: 'Temples',
                  color: const Color(0xFFF7A5A5),
                ),
                _buildCategoryCard(
                  icon: Icons.festival,
                  label: 'Festivals',
                  color: const Color(0xFFF7A5A5),
                ),
                _buildCategoryCard(
                  icon: Icons.palette,
                  label: 'Art',
                  color: const Color(0xFFF7A5A5),
                ),
                _buildCategoryCard(
                  icon: Icons.carpenter,
                  label: 'Crafts',
                  color: const Color(0xFFF7A5A5),
                ),
                _buildCategoryCard(
                  icon: Icons.food_bank,
                  label: 'Cuisine',
                  color: const Color(0xFFF7A5A5),
                ),
                _buildCategoryCard(
                  icon: Icons.checkroom,
                  label: 'Clothing',
                  color: const Color(0xFFF7A5A5),
                ),
                _buildCategoryCard(
                  icon: Icons.auto_stories,
                  label: 'Stories',
                  color: const Color(0xFFF7A5A5),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Traditional Arts Section
            const Text(
              'Traditional Arts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A2A4F),
              ),
            ),
            const SizedBox(height: 12),
            
            _buildInfoCard(
              icon: Icons.filter,
              title: 'Barong Dance',
              description: 'Traditional Balinese dance depicting the eternal battle between good and evil.',
              color: const Color(0xFFF7A5A5),
            ),
            
            const SizedBox(height: 12),
            
            _buildInfoCard(
              icon: Icons.music_note,
              title: 'Kecak Fire Dance',
              description: 'Mesmerizing dance performed by dozens of men chanting "cak" around flames.',
              color: const Color(0xFFF7A5A5),
            ),
            
            const SizedBox(height: 12),
            
            _buildInfoCard(
              icon: Icons.music_video,
              title: 'Gamelan Music',
              description: 'Traditional ensemble music using bronze percussion instruments.',
              color: const Color(0xFFF7A5A5),
            ),

            const SizedBox(height: 24),


          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .15),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withValues(alpha: .1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 32,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}