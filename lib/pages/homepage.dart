import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      
      // The drawer for navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Your Name"),
              accountEmail: Text("your.email@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("Y", style: TextStyle(fontSize: 40.0, color: Color(0xFF009688))),
              ),
              decoration: BoxDecoration(color: Color(0xFF009688)),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      
      
      
      
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
                      color: Colors.black.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                ),
              ),
            ),
            backgroundColor: const Color(0xFFefa355),
            expandedHeight: 160.0, 
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/SheRoam_background.webp', 
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),








          // This Sliver contains the main page content
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
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
                          color: Colors.amber[600],
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





                  // Search Bar to be implemented
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
        trailing: IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {},
        ),
        onTap: () {},
      ),
    );
  }
}