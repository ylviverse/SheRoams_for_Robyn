import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class SeminyakDetail extends StatelessWidget {
  const SeminyakDetail({super.key});

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
        onPressed: () => _launchURL('https://www.booking.com/city/id/seminyak.html'),
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
                    'assets/areas/seminyak.jpeg',
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
                          'Seminyak',
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
                              'Southwest Bali, Indonesia',
                              style: TextStyle(color: Colors.white70, fontSize: 16),
                            ),
                            Spacer(),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '4.7',
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
                    'The upscale beach town of Bali, famous for designer boutiques, world-class dining, and stunning sunsets.',
                    style: TextStyle(fontSize: 16, height: 1.5, color: _secondaryText),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      _buildTag('Beach'),
                      _buildTag('Shopping'),
                      _buildTag('Dining'),
                      _buildTag('Nightlife'),
                      _buildTag('Luxury'),
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
                        title: 'Double Six Beach',
                        subtitle: 'Sunset & Surf',
                        price: 'Free',
                        color: Colors.blue.shade50,
                        icon: Icons.beach_access,
                      ),
                      _buildHorizontalCard(
                        title: 'Eat Street',
                        subtitle: 'Petitenget',
                        price: 'Dining',
                        color: Colors.orange.shade50,
                        icon: Icons.restaurant,
                      ),
                      _buildHorizontalCard(
                        title: 'Potato Head',
                        subtitle: 'Beach Club',
                        price: '300k+ IDR',
                        color: Colors.pink.shade50,
                        icon: Icons.pool,
                      ),
                      _buildHorizontalCard(
                        title: 'Seminyak Square',
                        subtitle: 'Shopping',
                        price: 'Free Entry',
                        color: Colors.purple.shade50,
                        icon: Icons.shopping_bag,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Where to Eat (Compact List)
                _buildSectionTitle('Top Restaurants', Icons.restaurant_menu),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildCompactListTile('Merah Putih', 'Modern Indonesian • \$\$\$', 'Stunning interior', Icons.local_dining),
                      _buildCompactListTile('Motel Mexicola', 'Mexican Fiesta • \$\$', 'Vibrant atmosphere', Icons.celebration),
                      _buildCompactListTile('La Lucciola', 'Italian Beachfront • \$\$\$', 'Sunset views', Icons.wine_bar),
                      _buildCompactListTile('Sisterfields', 'Brunch Cafe • \$\$', 'Instagrammable', Icons.coffee),
                      _buildCompactListTile('Warung Made', 'Local • \$', 'Authentic Balinese', Icons.rice_bowl),
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
                      _buildActivityCard('Surfing', '150k+', Colors.blue.shade50),
                      _buildActivityCard('Shopping', 'Varies', Colors.pink.shade50),
                      _buildActivityCard('Beach Clubs', '300k+', Colors.orange.shade50),
                      _buildActivityCard('Spa', '250k+', Colors.purple.shade50),
                      _buildActivityCard('Sunset', 'Free', Colors.amber.shade50),
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
                      _buildBudgetRow('Budget', '\$20-50', 'Hostels & Guesthouses'),
                      const Divider(),
                      _buildBudgetRow('Mid-Range', '\$60-150', 'Boutique Hotels & Villas'),
                      const Divider(),
                      _buildBudgetRow('Luxury', '\$200+', 'Beach Resorts & 5-Star'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Beach Clubs
                _buildSectionTitle('Beach Clubs', Icons.beach_access),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildCompactListTile('Potato Head', 'Iconic • Pool & Beach', '300k min spend', Icons.pool),
                      _buildCompactListTile('Ku De Ta', 'Upscale • DJ Sets', '250k min spend', Icons.music_note),
                      _buildCompactListTile('Mrs Sippy', 'Salt Pool • Party Vibe', '200k min spend', Icons.local_bar),
                      _buildCompactListTile('Finns Beach Club', 'Family Friendly • Slides', '150k entry', Icons.water_drop),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Shopping Areas
                _buildSectionTitle('Shopping Spots', Icons.shopping_cart),
                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildHorizontalCard(
                        title: 'Seminyak Square',
                        subtitle: 'Mall & Shops',
                        price: 'Mid-Range',
                        color: Colors.teal.shade50,
                        icon: Icons.storefront,
                      ),
                      _buildHorizontalCard(
                        title: 'Jalan Laksmana',
                        subtitle: 'Eat Street',
                        price: 'Boutiques',
                        color: Colors.indigo.shade50,
                        icon: Icons.shopping_bag,
                      ),
                      _buildHorizontalCard(
                        title: 'Seminyak Village',
                        subtitle: 'Luxury Mall',
                        price: 'High-End',
                        color: Colors.deepPurple.shade50,
                        icon: Icons.diamond,
                      ),
                      _buildHorizontalCard(
                        title: 'Jalan Raya',
                        subtitle: 'Main Street',
                        price: 'Mixed',
                        color: Colors.lime.shade50,
                        icon: Icons.local_mall,
                      ),
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
                            _buildTransportItem('🛵 Scooter', '60k-100k/day'),
                            _buildTransportItem('🚗 Private Driver', '600k/day'),
                            _buildTransportItem('🚕 Grab/Gojek', 'Widely available'),
                            _buildTransportItem('🚶 Walking', 'Main areas walkable'),
                          ],
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Local Tips',
                        icon: Icons.lightbulb_outline,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('• Beach clubs require min. spend (200k-500k)'),
                            Text('• Book restaurants ahead on weekends'),
                            Text('• Traffic heavy 5-8pm on main roads'),
                            Text('• Bargain at boutiques (start 30% lower)'),
                            Text('• Sunset is 6-6:30pm year-round'),
                            Text('• Many shops close Nyepi Day (Balinese New Year)'),
                          ],
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Health & Safety',
                        icon: Icons.medical_services_outlined,
                        content: const Text(
                            'Very safe area with strong police presence. BIMC Hospital Seminyak for emergencies. Watch belongings at beach. Strong currents - swim between flags only. Sunscreen essential (SPF 50+).'
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Best Time to Visit',
                        icon: Icons.calendar_today,
                        content: const Text(
                            'Apr-Oct: Dry season, best beach weather. Dec-Mar: Rainy season but still warm. Avoid mid-July to Aug (peak crowds). Shoulder seasons (Apr-May, Sep-Oct) offer best balance of weather and prices.'
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Nightlife',
                        icon: Icons.nightlife,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('• Red Carpet - VIP clubbing experience'),
                            Text('• La Favela - Eclectic jungle club'),
                            Text('• Mirror Lounge - Rooftop cocktails'),
                            Text('• Jenja - Live music venue'),
                            Text('• Most clubs open 10pm-4am'),
                          ],
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