import 'package:flutter/material.dart';
import 'package:she_roams_bali/components/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_pkg;

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {


    final List<String> carouselImages = [

      'assets/slider/1.png',  
      
      'assets/slider/3.png',

      'assets/slider/2.png',
    ];

    return Scaffold(


      

      //call the drawer component
      drawer: const AppDrawer(),
      
      
      
      
      //using sliver for scrollable appbar through carousel package
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
            backgroundColor:  Color(0xFFF7A5A5),
            expandedHeight: 180.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: carousel_pkg.CarouselSlider(
                options: carousel_pkg.CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                ),
                items: carouselImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                            
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
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
                    'Plan Like a Goddess',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Explore Bali',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(CupertinoIcons.search, color: Colors.black),
                        onPressed: () {
                          // Add your search action here
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),





                  // Search Bar to be implemented, to be connected to a search function
                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Search',
                  //     prefixIcon: const Icon(Icons.search),
                  //     filled: true,
                  //     fillColor: Colors.grey[200],
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 15),





                  // Category List

                  _buildCategoryItem(context, 
                  icon: Icons.place, 
                  title: 'Popular Areas', 
                  subtitle: 'Areas to explore in Bali'),

                  _buildCategoryItem(context, 
                  icon: Icons.wb_sunny, 
                  title: 'Weather & Seasons', 
                  subtitle: "When's the best time to visit Bali" ),

                  _buildCategoryItem(context,
                  icon: Icons.airplane_ticket, 
                  title: 'Visa & Entry Requirements', 
                  subtitle: 'Accepted visas and entry rules' ),

                  _buildCategoryItem(context, 
                  icon: CupertinoIcons.creditcard_fill, 
                  title: 'Money & ATMs', 
                  subtitle: 'Using local currency and finding ATMs' ),

                  _buildCategoryItem(context, 
                  icon: Icons.sim_card_alert_sharp, 
                  title: 'Sim Card & Internet', 
                  subtitle: 'Guideline for accessing network and internet within Bali' ),

                
                  _buildCategoryItem(
                    context,
                    icon: Icons.palette, 
                    title: 'Culture & Heritage',
                    subtitle: 'Batik, gamelan, painting, dance, and carving.',
                  ),
                 
               
            
                  _buildCategoryItem(context,
                   icon: Icons.group, 
                   title: 'Cultural Etiquette', 
                   subtitle: 'How to dress and behave respectfully.'),

                  

                  _buildCategoryItem(context, 
                  icon: CupertinoIcons.airplane, 
                  title: 'Travel Protection', 
                  subtitle: 'Importance of travel & health insurance' ),


                  
                ],
              ),
            ),
          ),
        ],
      ),



      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          // Action when FAB is pressed
          
        },
        backgroundColor: const Color(0xFFF7A5A5),
        child: const Icon(CupertinoIcons.chat_bubble, color: Color(0xFF1A2A4F)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      





    );
  }
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
