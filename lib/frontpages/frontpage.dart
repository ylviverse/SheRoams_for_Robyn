import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:she_roams_bali/auth_pages/login_page.dart';
import 'package:she_roams_bali/auth_pages/signup_page.dart';
import 'package:she_roams_bali/page_switch/switch_bridge.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/images/final.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // Scrollable content on top
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),

                    // Logo
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: SvgPicture.asset(
                        'assets/images/Logo.svg',
                        fit: BoxFit.contain,
                      ),
                    ),

                    //This is the Main Title
                    Text(
                      'SheRoams',
                      style: TextStyle(
                        fontFamily: 'Rossten',
                        fontSize: 40,
                      ),
                    ),

                    Text(
                      'B A L I',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 14),
                    // Subtitle
                    Text(
                      '"Travel Like a Goddess"',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 70),

                    // Wave separator with icons
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: .3),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildWaveIcon(Icons.flight, 'Explore'),
                          Container(width: 2, height: 40, color: Color(0xFF172c47)),
                          _buildWaveIcon(CupertinoIcons.sparkles, 'Experience'),
                          Container(width: 2, height: 40, color: Color(0xFF172c47)),
                          _buildWaveIcon(Icons.place, 'Escape'),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),

                    // Info Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: .3),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'For Wandering Women',
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'SheRoams Bali is your trusted travel companion—built for women, by women. All listings are verified, safe, and locally loved',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildActionButton(
                          label: 'Login',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 55),
                        _buildActionButton(
                          label: 'Sign Up',
                          onTap: () {
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Continue as Guest button
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Continue as Guest',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build wave icon with label
  Widget _buildWaveIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: Color(0xFF172c47),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Helper widget to build action button
  Widget _buildActionButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF2C2C2C),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}