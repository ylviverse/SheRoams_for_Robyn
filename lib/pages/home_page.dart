import 'package:flutter/material.dart';
import 'package:she_roams_bali/components/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //call the drawer component
      drawer: const AppDrawer(),
      
      
      
      
      //using sliver for scrollable appbar
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                ),
              ),
            ),
            backgroundColor: const Color(0xFFF7A5A5),
            expandedHeight: 160.0, 
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/SheRoam_background.webp', 
                fit: BoxFit.cover,
                color: Colors.black.withValues(alpha: 0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),








          //this is the body content , the whole page is inside this container so changes are here
          SliverToBoxAdapter(
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SheRoams',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Explore Bali',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF7A5A5),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),





                  // Search Bar to be implemented, to be connected to a search function
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),





                  // Category List
                  _buildCategoryItem(
                    context,
                    icon: Icons.fort, 
                    title: 'Temples & Heritage',
                    subtitle: 'Sacred temples, palaces, and historical landmarks.',
                  ),
                  _buildCategoryItem(
                    context,
                    icon: Icons.celebration, 
                    title: 'Festivals & Ceremonies',
                    subtitle: 'Balinese holy days and cultural celebrations.',
                  ),
                  _buildCategoryItem(
                    context,
                    icon: Icons.palette, 
                    title: 'Traditional Arts',
                    subtitle: 'Batik, gamelan, painting, dance, and carving.',
                  ),
                   _buildCategoryItem(
                    context,
                    icon: Icons.holiday_village, 
                    title: 'Local Villages',
                    subtitle: 'Visits to traditional Balinese villages.',
                  ),
                   _buildCategoryItem(
                    context,
                    icon: Icons.store, 
                    title: 'Markets & Crafts',
                    subtitle: 'Handicraft and art markets.',
                  ),
                  _buildCategoryItem(context,
                   icon: Icons.group, 
                   title: 'Cultural Etiquette', 
                   subtitle: 'How to dress and behave respectfully.')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


















 // ...TESTTTTT and PLACEHOLDERS POP_UP till UI is DONE

  // Helper widget for creating a category list item
  Widget _buildCategoryItem(BuildContext context, {required IconData icon, required String title, required String subtitle}) {
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
          // Show the popup dialog when tapped
          _showCategoryDialog(context, title, icon);
        },
      ),
    );
  }

  // Method to show a dialog with a list of items for the selected category
  void _showCategoryDialog(BuildContext context, String categoryTitle, IconData icon) {
    // Sample data - you can replace this with real data from a database or API
    List<String> categoryItems = _getCategoryItems(categoryTitle);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFefa355),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: Colors.white, size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          categoryTitle,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                // List of items
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoryItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFFefa355).withValues(alpha: 0.2),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Color(0xFFefa355),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(categoryItems[index]),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Handle item selection
                          Navigator.pop(context);
                          // You can navigate to a detail page here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Selected: ${categoryItems[index]}'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Method to get sample items for each category
  List<String> _getCategoryItems(String category) {
    switch (category) {
      case 'Temples & Heritage':
        return [
          'Tanah Lot Temple',
          'Uluwatu Temple',
          'Besakih Temple',
          'Tirta Empul Temple',
          'Goa Gajah (Elephant Cave)',
          'Taman Ayun Temple',
        ];
      case 'Festivals & Ceremonies':
        return [
          'Nyepi (Day of Silence)',
          'Galungan & Kuningan',
          'Odalan (Temple Anniversary)',
          'Ngaben (Cremation Ceremony)',
          'Melasti Ceremony',
        ];
      case 'Traditional Arts':
        return [
          'Barong Dance',
          'Kecak Fire Dance',
          'Legong Dance',
          'Batik Making Workshop',
          'Wood Carving Class',
          'Gamelan Music Performance',
        ];
      case 'Local Villages':
        return [
          'Ubud Village',
          'Penglipuran Village',
          'Tenganan Village',
          'Celuk Village (Silver)',
          'Mas Village (Wood Carving)',
        ];
      case 'Markets & Crafts':
        return [
          'Ubud Art Market',
          'Sukawati Art Market',
          'Kumbasari Market',
          'Sanur Night Market',
          'Gianyar Night Market',
        ];
      case 'Cultural Etiquette':
        return [
          'Temple Dress Code',
          'Sacred Sites Behavior',
          'Greeting & Communication',
          'Photography Rules',
          'Offering Ceremonies',
          'Sacred Objects Respect',
        ];
      default:
        return ['No items available'];
    }
  }
}