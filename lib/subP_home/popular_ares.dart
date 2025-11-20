import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PopularAres extends StatefulWidget {
  const PopularAres({super.key});

  @override
  State<PopularAres> createState() => _PopularAresState();
}

class _PopularAresState extends State<PopularAres> {
  String selectedTab = 'Recommended'; 




  //list of recommended areas - to be changed with asynchronous data fetching
  final List<Map<String, String>> recommendedAreas = const [
    {
      'title': 'Ubud',
      'subtitle': 'Rice Terraces, Art Galleries, Wellness',
      'image': 'assets/areas/ubud.jpeg', 
    },
    {
      'title': 'Seminyak',
      'subtitle': 'Designer Boutiques,Beach, Sunset Dining',
      'image': 'assets/areas/seminyak.jpeg',
    },
    {
      'title': 'Canggu',
      'subtitle': 'Surf Scene, Trendy Cafes, Yoga Studios',
      'image': 'assets/areas/canggu.jpeg',
    },
    {
      'title': 'Uluwatu',
      'subtitle': 'Clifftop views, Surf Spots, Luxury Villas',
      'image': 'assets/areas/uluwatu.jpeg',
    },
    {
      'title': 'Sanur',
      'subtitle': 'Calm beaches and relaxation',
      'image': 'assets/areas/sanur.jpeg',
    },
    {
      'title': 'Nusa Dua',
      'subtitle': 'Luxury resorts and golf',
      'image': 'assets/areas/nusa_dua.jpeg',
    },
  ];
  
  //to be changed with asynchronous data fetching
  final List<Map<String, String>> nearbyAreas = const [
    {
      'title': 'Uluwatu',
      'subtitle': 'Clifftop views, Surf Spots, Luxury Villas',
      'image': 'assets/areas/uluwatu.jpeg',
    },
    {
      'title': 'Sanur',
      'subtitle': 'Calm beaches and relaxation',
      'image': 'assets/areas/sanur.jpeg',
    },
    {
      'title': 'Nusa Dua',
      'subtitle': 'Luxury resorts and golf',
      'image': 'assets/areas/nusa_dua.jpeg',
    },
  ];














//Build Method
 @override
Widget build(BuildContext context) {
  final currentAreas = selectedTab == 'Recommended' ? recommendedAreas : nearbyAreas;

  return Scaffold(
    backgroundColor: Color(0xFFF9F8F6),
    appBar: AppBar(
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      title: Text('Popular Areas', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
      backgroundColor: Color(0xFFF9F8F6),
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back, color: Colors.black),
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

        // List of areas - Changed from Grid to List
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final area = currentAreas[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _buildAreaCard(
                    context,
                    title: area['title']!,
                    subtitle: area['subtitle']!,
                    imagePath: area['image']!,
                  ),
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


// Helper to build each tab button
Widget _buildTabButton(String label) {
  final bool isSelected = selectedTab == label;
  
  return GestureDetector(
    onTap: () {
      setState(() {
        selectedTab = label;
      });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFffcad4).withValues(alpha: 0.6) 
        : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? Color(0xFFFFC4C4) : Colors.grey[200]!,
          width: .6,
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.black.withValues(alpha: .9) 
          : Colors.grey[600],
        ),
      ),
    ),
  );
}



// Helper to build each area card
Widget _buildAreaCard(
  BuildContext context, {
  required String title,
  required String subtitle,
  required String imagePath,
}) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Viewing details for $title'),
          duration: const Duration(seconds: 1),
        ),
      );
    },
    child: Container(
      height: 410, // Large card height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          
          // Background Image
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.image, size: 80, color: Colors.grey),
                    const SizedBox(height: 8),
                    Text(
                      'Image not found: $imagePath',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
          
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: .75),
                  ],
                ),
              ),
            ),
          ),
          
          // Top Location Badge
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .8),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.location_on, size: 18, color: Colors.black),
                  SizedBox(width: 6),
                  Text(
                    'Bali',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Indonesia',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
         
          
          // Bottom Content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),

                  // Arrow button only
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color:  Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}