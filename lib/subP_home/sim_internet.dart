import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class SimInternet extends StatefulWidget {
  const SimInternet({super.key});

  @override
  State<SimInternet> createState() => _SimInternetState();
}

class _SimInternetState extends State<SimInternet> {

  String _selectedCategory = 'Physical';

  final Set<String> _expandedProviders = {};
  
  final Map<String, List<Map<String, String>>> _providers = {
    'Physical': [
      {
        'name': 'Telkomsel',
        'description': "Indonesia's largest carrier; excellent 4G/5G reach across Bali; best for heavy users and remote travellers.",
        'coverage': 'Indonesia - Best island-wide coverage',
        'rating': '4.5',

        'link': 'https://www.telkomsel.com',
      },
      {
        'name': 'XL Axiata',
        'description': 'Reliable 4G in urban south; budget-friendly plans ideal for short stays.',
        'coverage': 'Indonesia - South & Central Bali (Kuta, Seminyak, Canggu, Ubud)',
        'rating': '4.6',

        'link': 'https://www.xl.co.id',
      },
      {
        'name': 'Indosat (IM3)',
        'description': 'Good for tourists in southern areas; quick activation and strong prepaid offers ',
        'coverage': 'Indonesia - South Bali, Uluwatu, Nusa Dua',
        'rating': '4.5',

        'link': 'https://indosatooredoo.com',
      },
      {
        'name': 'WorldSIM',
        'description': 'One of the oldest international SIM providers; wide global coverage',
        'coverage': 'Global',
        'rating': '4.6',

        'link': 'https://www.worldsim.com/affiliate-program',
      }
    ],







    //eSIM Providers

    'eSIM': [
      {
        'name': 'Telkomsel',
        'description': "Indonesia's largest carrier; excellent 4G/5G reach across Bali; best for heavy users and remote travellers.",
        'coverage': 'Indonesia - Best island-wide coverage',
        'rating': '4.5',

        'link': 'https://www.telkomsel.com',
      },

      {
        'name': 'XL Axiata',
        'description': 'Reliable 4G in urban south; budget-friendly plans ideal for short stays.',
        'coverage': 'Indonesia - South & Central Bali (Kuta, Seminyak, Canggu, Ubud)',
        'rating': '4.6',

        'link': 'https://www.xl.co.id',
      },

      {
        'name': 'Holafly',
        'description': 'Top-rated for pre-travel setup; unlimited plans; praised for simplicity',
        'coverage': 'Global',
        'rating': '4.7',

        'link': 'https://holafly.com/affiliates',
      },

      {
        'name': 'Airalo',
        'description': 'Highly trusted; easy app setup; reliable signal across Asia ',
        'coverage': 'Global',
        'rating': '4.6',

        'link': 'https://www.airalo.com/partner-with-us/affiliate-partners',
      },
      {
        'name': 'Nomad',
        'description': 'Clean app interface; flexible data plans; good reviews for Asia travel',
        'coverage': 'Global',
        'rating': '4.5',

        'link': 'https://www.getnomad.app/affiliate',
      },
      {
        'name': 'Jetpac',
        'description': 'Fast-growing global eSIM brand; praised for affordability and reliable signal.',
        'coverage': 'Global',
        'rating': '4.4',
        
        'link': 'https://jetpacglobal.com/pages/affiliates',
      },

      {
        'name': 'Saily by NordVPN',
        'description': 'Strong privacy-focused eSIM from Nord; fast setup',
        'coverage': 'Global',
        'rating': '4.7',
        'link': 'https://saily.com/affiliate',
      },

      {
        'name': 'ZenSim',
        'description': 'Smooth onboarding; praised for good connection quality in Bali region',
        'coverage': 'ASIA - PACIFIC',
        'rating': '4.6',
        'link': 'https://zensim.co/affiliate-program',
      },

      {
        'name': 'KeepGo',
        'description': 'Unique lifetime data balance model; ideal for repeat travellers',
        'coverage': 'Global - Lifetime Data SIMs',
        'rating': '4.6',
        'link': 'https://partners.keepgo.com',
      },

      {
        'name': 'Flexiroam',
        'description': 'Popular in Southeast Asia; strong regional coverage, especially Bali ',
        'coverage': 'ASIA - GLOBAL',
        'rating': '4.5',
        'link': 'https://www.flexiroam.com/partner-program',
      },

      {
        'name': 'eSIM go',
        'description': '20% affiliate commission; business-grade infrastructure; solid reviews',
        'coverage': ' GLOBAL',
        'rating': '4.5',
        'link': 'https://esimgo.com/product/industries/affiliates/',
      },

      {
        'name': 'Ubigi',
        'description': 'Easy in-app activation; supports both data and voice',
        'coverage': 'ASIA - GLOBAL',
        'rating': '4.5',
        'link': 'https://cellulardata.ubigi.com/pro/join-our-affiliate-program/',
      },

      {
        'name': 'Ubigi',
        'description': 'Easy in-app activation; supports both data and voice',
        'coverage': 'ASIA - GLOBAL',
        'rating': '4.5',
        'link': 'https://cellulardata.ubigi.com/pro/join-our-affiliate-program/',
      },

      {
        'name': 'SimOptions',
        'description': 'Reliable global reseller; highly rated for convenience and value ',
        'coverage': 'Global and regional travel bundles',
        'rating': '4.7',
        'link': 'https://www.simoptions.com/affiliate-program/',
      },

      {
        'name': 'BreezeSim',
        'description': 'Up to 20% affiliate commissions; new but growing provider',
        'coverage': 'GLOBAL - 150+ countries',
        'rating': '4.4',
        'link': 'https://breezesim.com/pages/become-an-affiliate',
      },

      {
        'name': 'TravelSim',
        'description': 'Well-known EU-based SIM provider; strong value for long trips',
        'coverage': 'Global (135+ countries)',
        'rating': '4.4',
        'link': 'https://www.travelsim.com/become-a-partner',
      },

      {
        'name': 'easySim Global',
        'description': 'Good data reliability; 24/7 chat support',
        'coverage': 'Global (180+ destinations)',
        'rating': '4.4',
        'link': 'https://www.easysim.global/partners',
      },

      {
        'name': 'eSIM.sm',
        'description': 'Affordable, reliable, and quick customer support',
        'coverage': 'Global (multi-region)',
        'rating': '4.6',
        'link': 'hhttps://esim.sm/en/affiliate',
      },

      {
        'name': 'Roamless',
        'description': 'Great UX; automatic top-up; solid reviews for consistent speeds ',
        'coverage': 'Global',
        'rating': '4.6',
        'link': 'https://roamless.com/affiliate-program',
      },

    ],
  };
















// this is the url launcher for  link
 Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}




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
          'SIM & Internet',
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
            'Stay Connected in Bali',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Everything you need to know about internet access',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),

          // Category Selector
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .5),
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
              children: [
                Expanded(
                  child: _buildCategoryButton('Physical'),
                ),
                Expanded(
                  child: _buildCategoryButton('eSIM'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Providers List
          ..._providers[_selectedCategory]!.map((provider) {
            return Column(
              children: [
                _buildProviderCard(
                  name: provider['name']!,
                  description: provider['description']!,
                  coverage: provider['coverage']!,
                  rating: provider['rating']!,
              
                  link: provider['link']!,
                ),
                const SizedBox(height: 14),
              ],
            );
          }),

          const SizedBox(height: 8),

          // Tips Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.lightbulb, color: Colors.green),
                    SizedBox(width: 8),
                    Text(
                      'SheRoam Tips',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildTipItem('Bring your passport for SIM registration'),
                _buildTipItem('Airport SIM counters may charge extra'),
                _buildTipItem('Check if your phone is unlocked before arrival'),
                _buildTipItem('Most cafés and hotels offer free WiFi'),
              ],
            ),
          ),
        ],
      ),
    );
  }



//this is the category container of Physical and eSIM
Widget _buildCategoryButton(String category) {
  final bool isSelected = _selectedCategory == category;
  return GestureDetector(
    onTap: () {
      setState(() {
        _selectedCategory = category;
      });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? 
        Color(0xFFffcad4).withValues(alpha: .5)
        : Colors.transparent,
        borderRadius: BorderRadius.circular(9),
        border: isSelected
            ? Border.all(
                color: Colors.transparent,
                width: 1.5,
              )
            : null,
      ),
      child: Text(
        category,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.black
          : Colors.grey[600],
        ),
      ),
    ),
  );
}





  //Provider Widget
  Widget _buildProviderCard({
    required String name,
    required String description,
    required String coverage,
    required String rating,
    required String link,
  }) {
    final bool isExpanded = _expandedProviders.contains(name);
    
    return Container(
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
      child: Column(
        children: [
          
          InkWell(
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedProviders.remove(name);
                } else {
                  _expandedProviders.add(name);
                }
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Icon
                  Icon(
                    _selectedCategory == 'Physical' 
                        ? Icons.sim_card 
                        : Icons.phone_iphone,
                    color: Color(0xFF16425B),
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  
                  // Name and Rating
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber[700], size: 16),
                            const SizedBox(width: 4),
                            Text(
                              rating,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Expand/Collapse Icon
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          
          // Expanded Content
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(height: 1),
                  const SizedBox(height: 12),
                  
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Coverage Info
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFF16425B)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.signal_cellular_alt, color: Color(0xFF16425B), size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            coverage,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF16425B),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Learn More Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _launchURL(link),
                      icon: const Icon(Icons.open_in_new, size: 18),
                      label: const Text('Learn More'),
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF16425B),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedSuperellipseBorder(
                          borderRadius: BorderRadius.circular(12),
                          
                        ),
                      ),
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








  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            size: 18,
            color: Colors.green,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
