import 'package:flutter/material.dart';
import 'package:she_roams_bali/components/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_pkg;
import 'package:she_roams_bali/sub_pages/culture_heritage.dart';
import 'package:she_roams_bali/sub_pages/money_and_atm.dart';
import 'package:she_roams_bali/sub_pages/popular_ares.dart';
import 'package:she_roams_bali/sub_pages/sim_internet.dart';
import 'package:she_roams_bali/sub_pages/visa_requirement.dart';
import 'package:she_roams_bali/sub_pages/weather_page.dart';

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
      backgroundColor: Color(0xFFF5F5F5),


      

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

                  _buildCategoryItem(
                    context,
                    icon: Icons.person_2, 
                    title: 'Culture & Heritage',
                    subtitle: 'Batik, gamelan, painting, dance, and carving.',
                  ),

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


















 //On tap section


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
          // REPLACE THE ENTIRE onTap SECTION WITH THIS:
          switch (title) {
            case 'Popular Areas':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PopularAres()),
              );
              break;
            case 'Weather & Seasons':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherPage()),
              );
              break;
            case 'Visa & Entry Requirements':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VisaRequirement()),
              );
              break;
             case 'Money & ATMs':
              Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const MoneyAndAtm()),
               );
             break;
             case 'Sim Card & Internet':
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const SimInternet()),
               );
               break;
             case 'Culture & Heritage':
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const CultureHeritage()),
               );
               break;
            // case 'Cultural Etiquette':
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const CulturalEtiquettePage()),
            //   );
            //   break;
            // case 'Travel Protection':
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const TravelProtectionPage()),
            //   );
            //   break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Page for $title coming soon!'),
                  duration: const Duration(seconds: 1),
                ),
              );
          }
        },
      ),
    );
  }


