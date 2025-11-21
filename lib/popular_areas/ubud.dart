import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class UbudDetail extends StatelessWidget {
  const UbudDetail({super.key});

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
        onPressed: () => _launchURL('https://www.booking.com/city/id/ubud.html'),
        backgroundColor: _primaryText,
        label: const Text('Book Stay', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.hotel, color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: [
          // 1. Sliver App Bar (Kept largely the same, it was good)
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
                    'assets/areas/ubud.jpeg',
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
                          'Ubud',
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
                              'Central Bali, Indonesia',
                              style: TextStyle(color: Colors.white70, fontSize: 16),
                            ),
                            Spacer(),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '4.8',
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
                    'The cultural heart of Bali, known for rice terraces, traditional arts, and wellness.',
                    style: TextStyle(fontSize: 16, height: 1.5, color: _secondaryText),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      _buildTag('🧘‍♀️ Yoga'),
                      _buildTag('🎨 Art'),
                      _buildTag('🌾 Nature'),
                      _buildTag('💻 Nomads'),
                      _buildTag('📸 Photo'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Horizontal Attractions (Carousel)
                _buildSectionTitle('Must-Visit Attractions', Icons.place_outlined),
                SizedBox(
                  height: 160, // Fixed height for horizontal cards
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildHorizontalCard(
                        title: 'Rice Terraces',
                        subtitle: 'Tegallalang',
                        price: '20k IDR',
                        color: Colors.green.shade50,
                        icon: Icons.landscape,
                      ),
                      _buildHorizontalCard(
                        title: 'Monkey Forest',
                        subtitle: 'Sanctuary',
                        price: '80k IDR',
                        color: Colors.brown.shade50,
                        icon: Icons.pets,
                      ),
                      _buildHorizontalCard(
                        title: 'Royal Palace',
                        subtitle: 'Central Ubud',
                        price: 'Free',
                        color: Colors.orange.shade50,
                        icon: Icons.account_balance,
                      ),
                      _buildHorizontalCard(
                        title: 'Ridge Walk',
                        subtitle: 'Campuhan',
                        price: 'Free',
                        color: Colors.blue.shade50,
                        icon: Icons.hiking,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Where to Eat (Compact List)
                _buildSectionTitle('Culinary Spots', Icons.restaurant_menu),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildCompactListTile('Locavore', 'Fine Dining • \$\$\$\$', 'Book weeks ahead', Icons.wine_bar),
                      _buildCompactListTile('Clear Cafe', 'Healthy Vegan • \$\$', 'Try smoothie bowls', Icons.eco),
                      _buildCompactListTile('Warung Biah Biah', 'Local • \$', 'Budget friendly', Icons.rice_bowl),
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
                      _buildActivityCard('Yoga', '150k+', Colors.purple.shade50),
                      _buildActivityCard('Cooking', '400k+', Colors.orange.shade50),
                      _buildActivityCard('Rafting', '350k+', Colors.blue.shade50),
                      _buildActivityCard('Dance', '75k+', Colors.red.shade50),
                      _buildActivityCard('Art', '200k+', Colors.yellow.shade50),
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
                      _buildBudgetRow('Budget', '\$10-30', 'Hostels & Guesthouses'),
                      const Divider(),
                      _buildBudgetRow('Mid-Range', '\$40-100', 'Boutique Villas'),
                      const Divider(),
                      _buildBudgetRow('Luxury', '\$150+', 'Resorts & Private Pools'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // SECTION: Essentials (Collapsible Expansion Tiles)
                // This saves a huge amount of vertical space
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
                            _buildTransportItem('🛵 Scooter', '50k-80k/day'),
                            _buildTransportItem('🚗 Driver', '500k/day'),
                            _buildTransportItem('🚕 Grab/Gojek', 'Available'),
                          ],
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Local Tips',
                        icon: Icons.lightbulb_outline,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('• Best time: Apr-Oct (dry season)'),
                            Text('• Dress modestly for temples'),
                            Text('• Don\'t look monkeys in the eye'),
                            Text('• Bargain at markets'),
                          ],
                        ),
                      ),
                      _buildExpansionSection(
                        title: 'Health & Safety',
                        icon: Icons.medical_services_outlined,
                        content: const Text(
                            'Very safe. Drink bottled water only. Use mosquito repellent (dengue risk). Ubud Clinic is available for emergencies.'
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

  // --- HELPER WIDGETS ---

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
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: Icon(icon, color: _accentColor),
        title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        textColor: Colors.black,
        iconColor: Colors.black,
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