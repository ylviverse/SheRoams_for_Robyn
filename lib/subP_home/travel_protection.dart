import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class TravelProtection extends StatefulWidget {
  const TravelProtection({super.key});

  @override
  State<TravelProtection> createState() => _TravelProtectionState();
}

class _TravelProtectionState extends State<TravelProtection> {
  String? expandedSection;

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
          'Travel Protection',
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
            'Travel with Confidence',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Protection & Peace of Mind for Your Bali Journey',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),

          _buildExpandableItem(
            title: 'Health & Wellness Insurance',
            icon: Icons.spa,
            iconColor: const Color(0xFF1ABC9C),
            sectionKey: 'health',
            content: _buildHealthInsuranceContent(),
          ),
          
          const SizedBox(height: 12),
          
          _buildExpandableItem(
            title: 'Travel & Security Insurance',
            icon: Icons.backpack,
            iconColor: const Color(0xFF3498DB),
            sectionKey: 'travel',
            content: _buildTravelInsuranceContent(),
          ),

          const SizedBox(height: 24),

          const Text(
            'Recommended Providers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2A4F),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Popular choices for female & solo travelers:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          
          _buildProviderCard(
            name: 'World Nomads',
            coverage: 'Comprehensive medical & adventure sports',
            bestFor: 'The Adventurer (surfing, hiking) & gear cover',
            color: const Color(0xFFF7A5A5),
            url: 'https://www.worldnomads.com',
          ),
          
          const SizedBox(height: 12),
          
          _buildProviderCard(
            name: 'SafetyWing',
            coverage: 'Remote health insurance for travelers',
            bestFor: 'The Digital Nomad & long-term flexibility',
            color: const Color(0xFFF7A5A5),
            url: 'https://www.safetywing.com',
          ),
          
          const SizedBox(height: 12),
          
          _buildProviderCard(
            name: 'Heymondo',
            coverage: 'All-around protection & app-based claims',
            bestFor: 'Comprehensive cover & an easy-to-use app',
            color: const Color(0xFFF7A5A5),
            url: 'https://www.heymondo.com',
          ),
        ],
      ),
    );
  }


  //widget to build expandable item
  Widget _buildExpandableItem({
    required String title,
    required IconData icon,
    required Color iconColor,
    required String sectionKey,
    required Widget content,
  }) {
    final isExpanded = expandedSection == sectionKey;

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
                color: iconColor.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 24,
            ),
            onTap: () {
              setState(() {
                expandedSection = isExpanded ? null : sectionKey;
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


  //widget to build health insurance content
  Widget _buildHealthInsuranceContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        
        const Text(
          'Why It Matters:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        _buildBulletPoint('Access to female-friendly clinics & doctors'),
        _buildBulletPoint('Covers women-specific health needs & emergencies'),
        _buildBulletPoint('Support for mental health and counseling'),
        _buildBulletPoint('Peace of mind for wellness activities (yoga, retreats)'),
        
        const SizedBox(height: 16),
        
        const Text(
          'What to Look For:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.check_circle, 'Medical', 'At least \$100,000 coverage'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.support_agent, '24/7 Crisis Hotline', 'Compassionate, multi-lingual support'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.check_circle, 'Women\'s Health', 'Access to gynecologists & specialists'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.check_circle, 'Wellness/Sports', 'Cover for yoga, surfing, trekking'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.check_circle, 'Crisis Support', 'Cover for assault-related medical/psychological care'),
        
        const SizedBox(height: 16),
        
        _buildInfoBox(
          color: Colors.red.shade400,
          icon: Icons.phone,
          text: 'Local Help: The "Bali Women\'s Crisis Centre" (BWCC) is a key resource. Find them online for their hotline.',
        ),
        const SizedBox(height: 8),
        _buildClickableLinkRow(
          Icons.open_in_new,
          'For more information, visit',
          'https://www.bwcc.or.id',
        ),
      ],
    );
  }


  // Helper to build travel insurance content
  Widget _buildTravelInsuranceContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        
        const Text(
          'Coverage Includes:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        _buildBulletPoint('Trip cancellation or interruption'),
        _buildBulletPoint('Theft (phones, bags, cameras)'),
        _buildBulletPoint('Lost, stolen, or delayed baggage'),
        _buildBulletPoint('Personal liability (e.g., scooter accident)'),
        _buildBulletPoint('Lost/stolen passport and travel documents'),
        
        const SizedBox(height: 16),
        
        const Text(
          'Important Considerations:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.motorcycle, 'Scooter Theft', 'Keep bags in the seat, NOT on your shoulder'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.lock, 'Valuables', 'Use your hotel or villa safe; don\'t flash cash'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.description, 'Documents', 'Email photos of your passport & visa to yourself'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.phone_android, 'Emergency contact', 'Save insurer\'s 24/7 hotline'),
        
        const SizedBox(height: 16),
        
        _buildInfoBox(
          color: Colors.green,
          icon: Icons.thumb_up,
          text: 'Many credit cards offer travel insurance - check yours!',
        ),
      ],
    );
  }



  // Helper to build provider card
  Widget _buildProviderCard({
    required String name,
    required String coverage,
    required String bestFor,
    required Color color,
    String? url,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: .3), width: 2),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.verified_user, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check_circle, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  coverage,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Best for: $bestFor',
                  style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          
          if (url != null) ...[
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 12),
            _buildClickableLinkRow(
              Icons.open_in_new,
              'For more information, visit',
              url,
            ),
          ],
        ],
      ),
    );
  }



  // Helper to build clickable link row
  Widget _buildClickableLinkRow(IconData icon, String label, String url) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$label:',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () => _launchURL(url),
                child: Text(
                  url,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A90E2),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  // Helper to build info box
  Widget _buildInfoBox({
    required Color color,
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }


  // Helper to build info row
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }


  // Helper to build bullet point text
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }


  // Launch URL with error handling
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $urlString');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open the link'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}