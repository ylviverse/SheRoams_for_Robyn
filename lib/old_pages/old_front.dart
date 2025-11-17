import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:she_roams_bali/page_switch/switch_bridge.dart';


class OldFrontPage extends StatelessWidget {
  const OldFrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  

                  // Logo
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: SvgPicture.asset(
                      'assets/images/Logo.svg',
                      fit: BoxFit.contain,
                    ),
                  ),

                  //This is the Main Title
                  Text(
                    'SheRoams',
                    style: GoogleFonts.roboto(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  Text(
                    'B A L I',
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 14),
                  // Subtitle
                  Text(
                    '"Travel boldly.Roam freely."',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 24),



                  // Weather placeholders 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wb_sunny, color: Colors.orange, size: 28),
                      SizedBox(width: 8),
                      Text(
                        '27° Partly cloudy (place holder)',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),



                  // Action Buttons for the three main features
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildActionButton(
                        icon: Icons.flight,
                        label: 'Plan My\nTrip',
                        color: Color(0xFFf9537d),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        },
                      ),
                      _buildActionButton(
                        icon: Icons.chat_bubble_rounded,
                        label: 'Ask\nSari AI',
                        color: Color(0xFFec2972),
                        onTap: () {},
                      ),
                      _buildActionButton(
                        icon: Icons.place,
                        label: 'Explore\nMap',
                        color: Color(0xFFfe7346),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 32),




                  // Trending Card placeholder
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trending This Week',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Top 5 brunch spots to try 🥞 Apr 22',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),



                  // Description Text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'SheRoams Bali is your trusted travel companion—built for women, by women. All listings are verified, safe, and locally loved',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1A1A1A),
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }







// this functions handles the action buttons 

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105,
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
