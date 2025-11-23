import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class CangguDetail extends StatelessWidget {
  const CangguDetail({super.key});

  // Unified Theme Colors
  final Color _accentColor = const Color(0xFFffcad4);
  final Color _primaryText = const Color(0xFF1A1A1A);
  final Color _secondaryText = const Color(0xFF666666);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F6),
      // Floating Action Button for the most important conversion action
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _launchURL('https://www.booking.com/city/id/canggu.html'),
        backgroundColor: _primaryText,
        label: const Text('Book Stay', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.hotel, color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: [
          // 1. Sliver App Bar
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFFF9F8F6),
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(CupertinoIcons.back, color: Colors.black),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/areas/canggu.jpeg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.6),
                        ],
                      ),
                    ),
                  ),
                  // Title moved inside image for magazine look
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Canggu',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.location_on, color: Colors.white70, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'South Bali, Indonesia',
                              style: TextStyle(color: Colors.white70, fontSize: 16),
                            ),
                            Spacer(),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '4.6',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
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
          ),

          // 2. Content Body
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // SECTION: Intro & Tags (Horizontal Scroll)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Bali\'s hippest surf town, blending laid-back beach vibes with trendy cafes, coworking spaces, and a thriving digital nomad community.',
                    style: TextStyle(fontSize: 16, height: 1.5, color: _secondaryText),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      _buildTag('Surfing'),
                      _buildTag('Cafes'),
                      _buildTag('Nomads'),
                      _buildTag('Yoga'),
                      _buildTag('Nightlife'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Horizontal Attractions (Carousel)
                _buildSectionTitle('Must-Visit Spots', Icons.place_outlined),
                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildHorizontalCard(
                        title: 'Echo Beach',
                        subtitle: 'Surf & Sunsets',
                        price: 'Free',
                        color: Colors.blue.shade50,
                        icon: Icons.surfing,
                      ),
                      _buildHorizontalCard(
                        title: 'Tanah Lot',
                        subtitle: 'Temple',
                        price: '60k IDR',
                        color: Colors.orange.shade50,
                        icon: Icons.temple_hindu,
                      ),
                      _buildHorizontalCard(
                        title: 'Batu Bolong',
                        subtitle: 'Beach',
                        price: 'Free',
                        color: Colors.teal.shade50,
                        icon: Icons.beach_access,
                      ),
                      _buildHorizontalCard(
                        title: 'Rice Fields',
                        subtitle: 'Shortcut',
                        price: 'Free',
                        color: Colors.green.shade50,
                        icon: Icons.landscape,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Where to Eat (Compact List)
                _buildSectionTitle('Trendy Cafes & Eateries', Icons.restaurant_menu),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildCompactListTile('Betelnut Cafe', 'Healthy Brunch • \$\$', 'Instagram worthy', Icons.breakfast_dining),
                      _buildCompactListTile('Crate Cafe', 'Specialty Coffee • \$\$', 'Coworking vibe', Icons.coffee),
                      _buildCompactListTile('The Shady Shack', 'Vegan • \$\$', 'Garden setting', Icons.eco),
                      _buildCompactListTile('La Brisa', 'Seafood Beach Club • \$\$\$', 'Boho chic', Icons.anchor),
                      _buildCompactListTile('Warung Dandelion', 'Local • \$', 'Authentic & cheap', Icons.rice_bowl),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Experiences (Horizontal Chips/Cards)
                _buildSectionTitle('Things to Do', Icons.local_activity_outlined),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      _buildActivityCard('Surf Lesson', '350k+', Colors.blue.shade50),
                      _buildActivityCard('Yoga Class', '150k+', Colors.purple.shade50),
                      _buildActivityCard('Cafe Hopping', 'Varies', Colors.brown.shade50),
                      _buildActivityCard('Coworking', '100k+', Colors.orange.shade50),
                      _buildActivityCard('Sunset', 'Free', Colors.pink.shade50),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Accommodation (Grouped by budget)
                _buildSectionTitle('Where to Stay', Icons.bed_outlined),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildBudgetRow('Budget', '\$15-35', 'Hostels & Shared Villas'),
                      const Divider(),
                      _buildBudgetRow('Mid-Range', '\$50-120', 'Private Villas & Boutique'),
                      const Divider(),
                      _buildBudgetRow('Luxury', '\$150+', 'Beachfront Resorts'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Surf Spots
                _buildSectionTitle('Surf Breaks', Icons.surfing),
                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildHorizontalCard(
                        title: 'Batu Bolong',
                        subtitle: 'Beginners',
                        price: 'Beach break',
                        color: Colors.lightBlue.shade50,
                        icon: Icons.waves,
                      ),
                      _buildHorizontalCard(
                        title: 'Old Man\'s',
                        subtitle: 'Easy waves',
                        price: 'Long left',
                        color: Colors.cyan.shade50,
                        icon: Icons.surfing,
                      ),
                      _buildHorizontalCard(
                        title: 'Echo Beach',
                        subtitle: 'Intermediate',
                        price: 'Reef break',
                        color: Colors.indigo.shade50,
                        icon: Icons.water,
                      ),
                      _buildHorizontalCard(
                        title: 'Berawa Beach',
                        subtitle: 'Mixed levels',
                        price: 'Beach break',
                        color: Colors.blue.shade100,
                        icon: Icons.beach_access,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Coworking Spaces
                _buildSectionTitle('Digital Nomad Spots', Icons.laptop_mac),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildCompactListTile('Dojo Bali', 'Premium Coworking • 150k/day', 'Fast WiFi & AC', Icons.work),
                      _buildCompactListTile('Tropical Nomad', 'Relaxed Space • 100k/day', 'Pool & cafe', Icons.pool),
                      _buildCompactListTile('Outpost', 'Full Service • 175k/day', 'Events & community', Icons.groups),
                      _buildCompactListTile('Cafe Hopping', 'Free with purchase', '50k coffee = workspace', Icons.coffee_maker),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Nightlife
                _buildSectionTitle('Nightlife & Bars', Icons.nightlife),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildCompactListTile('Old Man\'s', 'Beach Bar • Live Music', 'Daily sunset sessions', Icons.music_note),
                      _buildCompactListTile('Pretty Poison', 'Cocktail Bar • Trendy', 'Instagram hotspot', Icons.local_bar),
                      _buildCompactListTile('The Lawn', 'Beach Club • Day to Night', 'Pool & beach access', Icons.beach_access),
                      _buildCompactListTile('Finns Beach Club', 'Upscale • Pool Parties', 'Sunday sessions', Icons.celebration),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Essentials (Collapsible Expansion Tiles)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Essentials', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      _buildExpansionSection(
                        title: 'Getting Around',
                        icon: Icons.directions_bike,
                        content: Column(
                          children: [
                            _buildTransportItem('🛵 Scooter', '60k-80k/day'),
                            _buildTransportItem('🚗 Private Driver', '550k/day'),
                            _buildTransportItem('🚕 Grab/Gojek', 'Widely available'),
                            _buildTransportItem('🚶 Walking', 'Between cafes OK'),
                          ],
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Local Tips',
                        icon: Icons.lightbulb_outline,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('• Best surf: Apr-Oct (dry season)'),
                            Text('• Traffic jams 5-8pm on main roads'),
                            Text('• Scooter parking can be chaotic'),
                            Text('• Cafes get crowded 9am-2pm'),
                            Text('• Sunset at Echo Beach is magical'),
                            Text('• Rice field shortcut saves 15 mins'),
                          ],
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Health & Safety',
                        icon: Icons.medical_services_outlined,
                        content: const Text(
                            'Safe area, busy at night. Siloam Hospital 15 mins away. Watch for rip currents when swimming. Scooter accidents common - wear helmet. Strong sun - SPF 50+ essential. Mosquitos at dusk - use repellent.'
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'WiFi & Connectivity',
                        icon: Icons.wifi,
                        content: const Text(
                            'Most cafes have good WiFi (20-50 Mbps). Coworking spaces offer 100+ Mbps. Get local SIM at Circle K (50k for 20GB). Telkomsel has best coverage. Popular cafe WiFi passwords often "canggu2024".'
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Best Time to Visit',
                        icon: Icons.calendar_today,
                        content: const Text(
                            'Apr-Sep: Perfect weather, best surf. Oct-Nov: Shoulder season, less crowded. Dec-Mar: Rainy but still lively. Avoid August if you dislike crowds. Mondays are quietest.'
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100), // Space for FAB
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: _accentColor),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _primaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCard({
    required String title,
    required String subtitle,
    required String price,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.black54, size: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: _secondaryText, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompactListTile(String title, String subtitle, String trailing, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _accentColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.black54, size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: TextStyle(color: _secondaryText, fontSize: 12)),
        trailing: Text(
          trailing,
          style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.orange),
        ),
        dense: true,
      ),
    );
  }

  Widget _buildActivityCard(String title, String price, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(fontSize: 12, color: Colors.black.withValues(alpha: 0.6)),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetRow(String label, String price, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(type, style: TextStyle(fontSize: 12, color: _secondaryText)),
              ],
            ),
          ),
          Text(price, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.green)),
        ],
      ),
    );
  }

  Widget _buildExpansionSection({required String title, required IconData icon, required Widget content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        leading: Icon(icon, color: _accentColor),
        title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        textColor: Colors.black,
        iconColor: Colors.black,
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [content],
      ),
    );
  }

  Widget _buildTransportItem(String title, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(price, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
    );
  }
}