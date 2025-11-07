import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PopularAres extends StatefulWidget {
  const PopularAres({super.key});

  @override
  State<PopularAres> createState() => _PopularAresState();
}

class _PopularAresState extends State<PopularAres> {
  String selectedTab = 'Recommended'; 

  final List<Map<String, String>> recommendedAreas = const [
    {
      'title': 'Ubud',
      'subtitle': 'Rice Terraces, Art Galleries, Wellness',
      'image': 'assets/areas/ubud.jpg', 
    },
    {
      'title': 'Seminyak',
      'subtitle': 'Designer Boutiques,Beach, Sunset Dining',
      'image': 'assets/areas/seminyak.jpg',
    },
    {
      'title': 'Canggu',
      'subtitle': 'Surf Scene, Trendy Cafes, Yoga Studios',
      'image': 'assets/areas/canggu.jpg',
    },
  ];

  final List<Map<String, String>> nearbyAreas = const [
    {
      'title': 'Uluwatu',
      'subtitle': 'Clifftop views, Surf Spots, Luxury Villas',
      'image': 'assets/areas/uluwatu.jpg',
    },
    {
      'title': 'Sanur',
      'subtitle': 'Calm beaches and relaxation',
      'image': 'assets/areas/sanur.jpg',
    },
    {
      'title': 'Nusa Dua',
      'subtitle': 'Luxury resorts and golf',
      'image': 'assets/areas/nusa_dua.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    
    final currentAreas = selectedTab == 'Recommended' ? recommendedAreas : nearbyAreas;

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: const Color(0xFFF7A5A5),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // Tab Selection Row
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabButton('Recommended'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTabButton('Nearby'),
                  ),
                ],
              ),
            ),
          ),

          // Grid of areas
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final area = currentAreas[index];
                  return _buildAreaCard(
                    context,
                    title: area['title']!,
                    subtitle: area['subtitle']!,
                    imagePath: area['image']!,
                  );
                },
                childCount: currentAreas.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
    );
  }

  // Tab button widget
  Widget _buildTabButton(String title) {
    final bool isSelected = selectedTab == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7A5A5) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFefa355) : Colors.grey.shade300,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAreaCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to area detail page
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Viewing details for $title'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image (using placeholder for now )
            Image.network(
              'https://picsum.photos/seed/$title/200/300', // Replace with AssetImage
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: Color(0xFFF7A5A5),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Bali, Indonesia',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}