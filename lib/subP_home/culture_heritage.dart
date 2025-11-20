import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CultureHeritage extends StatefulWidget {
  const CultureHeritage({super.key});

  @override
  State<CultureHeritage> createState() => _CultureHeritageState();
}

class _CultureHeritageState extends State<CultureHeritage> {
  String? expandedCategory;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Culture & Heritage'),
        backgroundColor: const Color(0xFFF5F5F5),
        toolbarHeight: 50,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        elevation: 0
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Explore Bali\'s Rich Culture',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Traditions, ceremonies & heritage',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),

          // Expandable Categories
          _buildExpandableCategory(
            icon: Icons.theater_comedy,
            title: 'Traditional Dance',
            subtitle: 'Legong, Barong, Kecak & more',
            categoryKey: 'dance',
            content: _buildDanceContent(),
          ),

          const SizedBox(height: 12),

          _buildExpandableCategory(
            icon: Icons.music_note,
            title: 'Music & Gamelan',
            subtitle: 'Traditional instruments & performances',
            categoryKey: 'music',
            content: _buildMusicContent(),
          ),

          const SizedBox(height: 12),

          _buildExpandableCategory(
            icon: Icons.mosque,
            title: 'Temples & Sacred Sites',
            subtitle: 'Architecture, etiquette & visiting tips',
            categoryKey: 'temples',
            content: _buildTemplesContent(),
          ),

          const SizedBox(height: 12),

          _buildExpandableCategory(
            icon: Icons.celebration_sharp,
            title: 'Festivals & Ceremonies',
            subtitle: 'Nyepi, Galungan, temple anniversaries',
            categoryKey: 'festivals',
            content: _buildFestivalsContent(),
          ),

          const SizedBox(height: 12),

          _buildExpandableCategory(
            icon: Icons.palette,
            title: 'Art & Painting',
            subtitle: 'Ubud art scene & traditional styles',
            categoryKey: 'art',
            content: _buildArtContent(),
          ),

          const SizedBox(height: 12),

          _buildExpandableCategory(
            icon: Icons.brush,
            title: 'Crafts & Handicrafts',
            subtitle: 'Wood carving, textiles & silver work',
            categoryKey: 'crafts',
            content: _buildCraftsContent(),
          ),

          const SizedBox(height: 24),

          // Cultural Etiquette Section
          const Text(
            'Cultural Etiquette',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.checkroom,
            title: 'Dress Code & Attire',
            description: 'Wear a sarong and sash when visiting temples. Modest clothing is appreciated.',
          ),

          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.pan_tool,
            title: 'Temple Etiquette',
            description: 'Remove shoes, don\'t stand higher than priest, avoid menstruating women entering.',
          ),

          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.spa,
            title: 'Daily Offerings',
            description: 'Canang sari are small offerings placed everywhere. Don\'t step on them.',
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableCategory({
    required IconData icon,
    required String title,
    required String subtitle,
    required String categoryKey,
    required Widget content,
  }) {
    final isExpanded = expandedCategory == categoryKey;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color:  Colors.black.withValues(alpha: .8), size: 28),
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 24,
            ),
            onTap: () {
              setState(() {
                expandedCategory = isExpanded ? null : categoryKey;
              });
            },
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: content,
            ),
        ],
      ),
    );
  }

  Widget _buildDanceContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),
        const Text(
          'Traditional Balinese Dance',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildBulletPoint('Legong Dance - Graceful dance performed by young girls'),
        _buildBulletPoint('Barong Dance - Epic battle between good (Barong) and evil (Rangda)'),
        _buildBulletPoint('Kecak Fire Dance - 100+ men chanting "cak" around flames'),
        _buildBulletPoint('Pendet - Welcome dance for temple ceremonies'),
        const SizedBox(height: 16),
        const Text(
          'Where to Watch',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildLocationItem('Ubud Palace', 'Daily performances at 7:30 PM'),
        _buildLocationItem('Uluwatu Temple', 'Kecak dance at sunset'),
        _buildLocationItem('Batubulan Village', 'Morning Barong dance shows'),
        const SizedBox(height: 16),
        _buildAffiliateLink(
          'For more information visit:',
          'https://www.getyourguide.com/bali-traditional-dance',
        ),
      ],
    );
  }

  Widget _buildMusicContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),
        const Text(
          'Gamelan Orchestra',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          'Traditional ensemble of bronze percussion instruments including gongs, metallophones, drums, and bamboo flutes.',
          style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
        ),
        const SizedBox(height: 16),
        const Text(
          'Key Instruments',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildBulletPoint('Gangsa - Bronze metallophones'),
        _buildBulletPoint('Kendang - Double-headed drums'),
        _buildBulletPoint('Gong - Large hanging gongs'),
        _buildBulletPoint('Suling - Bamboo flute'),
        const SizedBox(height: 16),
        _buildAffiliateLink(
          'For more information visit:',
          'https://www.getyourguide.com/bali-gamelan-music',
        ),
      ],
    );
  }

  Widget _buildTemplesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),
        const Text(
          'Temple Etiquette',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildBulletPoint('Wear a sarong and sash (often provided at entrance)'),
        _buildBulletPoint('Remove shoes before entering'),
        _buildBulletPoint('Don\'t stand higher than the priest during ceremonies'),
        _buildBulletPoint('Menstruating women should not enter temples'),
        _buildBulletPoint('Respectful behavior - no loud talking or inappropriate clothing'),
        const SizedBox(height: 16),
        const Text(
          'Must-Visit Temples',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildLocationItem('Tanah Lot', 'Iconic sea temple at sunset'),
        _buildLocationItem('Uluwatu Temple', 'Clifftop temple with Kecak dance'),
        _buildLocationItem('Besakih', 'Mother Temple on Mt. Agung'),
        _buildLocationItem('Tirta Empul', 'Holy spring water temple'),
        const SizedBox(height: 16),
        _buildAffiliateLink(
          'For more information visit:',
          'https://www.getyourguide.com/bali-temple-tours',
        ),
      ],
    );
  }

  Widget _buildFestivalsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),
        const Text(
          'Major Festivals',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildFestivalItem('Nyepi', 'Balinese New Year - Day of Silence'),
        _buildFestivalItem('Galungan', 'Victory of dharma over adharma'),
        _buildFestivalItem('Kuningan', '10 days after Galungan'),
        _buildFestivalItem('Odalan', 'Temple anniversary celebrations'),
        const SizedBox(height: 16),
        _buildAffiliateLink(
          'For more information visit:',
          'https://www.getyourguide.com/bali-festivals',
        ),
      ],
    );
  }

  Widget _buildArtContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),
        const Text(
          'Art Styles',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildBulletPoint('Ubud Style - Detailed nature scenes'),
        _buildBulletPoint('Batuan Style - Dense, dark mythological paintings'),
        _buildBulletPoint('Kamasan - Traditional wayang-style paintings'),
        const SizedBox(height: 16),
        const Text(
          'Where to Explore',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildLocationItem('Ubud Art Market', 'Local paintings & crafts'),
        _buildLocationItem('Neka Art Museum', 'Traditional & contemporary art'),
        _buildLocationItem('ARMA', 'Agung Rai Museum of Art'),
        const SizedBox(height: 16),
        _buildAffiliateLink(
          'For more information visit:',
          'https://www.getyourguide.com/bali-art-tours',
        ),
      ],
    );
  }

  Widget _buildCraftsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),
        const Text(
          'Traditional Crafts',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildBulletPoint('Wood Carving - Mas village specialty'),
        _buildBulletPoint('Silver Jewelry - Celuk village'),
        _buildBulletPoint('Batik & Ikat Textiles - Traditional weaving'),
        _buildBulletPoint('Stone Carving - Temple decorations'),
        const SizedBox(height: 16),
        const Text(
          'Craft Villages',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildLocationItem('Mas', 'Wood carving center'),
        _buildLocationItem('Celuk', 'Silver & gold jewelry'),
        _buildLocationItem('Batubalan', 'Stone carving'),
        _buildLocationItem('Tenganan', 'Traditional weaving'),
        const SizedBox(height: 16),
        _buildAffiliateLink(
          'For more information visit:',
          'https://www.getyourguide.com/bali-craft-villages',
        ),
      ],
    );
  }


  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: Colors.grey[700]),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationItem(String name, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on, size: 16, color: Color(0xFFF7A5A5)),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(description, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFestivalItem(String name, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.celebration, size: 16, color: Color(0xFFF7A5A5)),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(description, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // New affiliate link widget
  Widget _buildAffiliateLink(String label, String url) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () async {
            final Uri uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
          child: Row(
            children: [
              Icon(Icons.open_in_new, size: 14, color: Colors.blue[700]),
              const SizedBox(width: 4),
              Text(
                'Learn more',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue[700],
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue[700],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }





  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.black.withValues(alpha: .9), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}