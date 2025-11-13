import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';


class VisaRequirement extends StatefulWidget {
  const VisaRequirement({super.key});

  @override
  State<VisaRequirement> createState() => _VisaRequirementState();
}

class _VisaRequirementState extends State<VisaRequirement> {
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
          'Visa & Entry',
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
            'Entry Requirements',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Visa options for visiting Bali',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),

          // Visa Categories
          _buildExpandableItem(
            title: 'Visa on Arrival (VOA)',
            sectionKey: 'voa',
            content: _buildVOAContent(),
          ),
          _buildExpandableItem(
            title: 'Visa-Free Entry',
            sectionKey: 'visa_free',
            content: _buildVisaFreeContent(),
          ),
          _buildExpandableItem(
            title: 'E-Visa',
            sectionKey: 'e_visa',
            content: _buildEVisaContent(),
          ),

           _buildExpandableItem(
            title: 'Golden Visa & Other Options',
            sectionKey: 'golden_visa',
            content: _buildGoldenVisaContent(),
          ),
          _buildExpandableItem(
            title: 'Extension Process',
            sectionKey: 'extension',
            content: _buildExtensionContent(),
          ),

          
          _buildExpandableItem(
            title: 'Custom Declaration',
            sectionKey: 'customs',
            content: _buildCustomsContent(),
          ),

          _buildImportantReminder(),
        ],
      ),
    );
  }

  Widget _buildExpandableItem({
    required String title,
    required String sectionKey,
    required Widget content,
  }) {
    final isExpanded = expandedSection == sectionKey;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
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
      ),
    );
  }





  // Content for VOA
  Widget _buildVOAContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        _buildInfoRow(Icons.access_time, 'Duration', '30 days, extendable once for another 30 days'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.attach_money, 'Cost', 'IDR 500,000 (approx. \$35 USD)'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.location_on, 'Available at', 'All major airports and seaports'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.description, 'Requirements', 'Valid passport (6+ months), return ticket'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade100),
          ),
          child: Column(
            children: [
              Row(
                children: const [
                 
                  Expanded(
                    child: Text(
                      'Best for tourists planning to stay 30-60 days',
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildClickableLinkRow(
                Icons.info_outline,
                'For more info, visit',
                'https://www.imigrasi.go.id',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Content for Visa-Free
  Widget _buildVisaFreeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        _buildInfoRow(Icons.access_time, 'Duration', '30 days, non-extendable'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.money_off, 'Cost', 'Free'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.public, 'Eligible countries', '169 countries including US, UK, EU, Australia, all ASEAN'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.flight_takeoff, 'Entry points', 'Selected airports and seaports only'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  
                  Expanded(
                    child: Text(
                      'Cannot be extended. Must leave after 30 days',
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildClickableLinkRow(
                Icons.info_outline,
                'For more info, visit',
                'https://www.imigrasi.go.id',
              ),
            ],
          ),
        ),
      ],
    );
  }


  // Content for E-Visa
  Widget _buildEVisaContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        _buildClickableLinkRow(
          Icons.computer,
          'Apply online at',
          'https://evisa.imigrasi.go.id',
        ),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.access_time, 'Processing time', '3-5 business days'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.attach_money, 'Cost', 'IDR 500,000 + service fee'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.check_circle, 'Benefits', 'Skip airport queues, apply from home'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: const [
              Icon(Icons.thumb_up, color: Colors.green, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Recommended for hassle-free arrival',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Content for Extension
  Widget _buildExtensionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        _buildInfoRow(Icons.schedule, 'When to apply', 'At least 7 days before expiry'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.attach_money, 'Cost', 'IDR 500,000'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.location_city, 'Where', 'Immigration office in Denpasar'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.access_time, 'Processing', '2-3 days'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.description, 'Documents', 'Passport, sponsor letter, accommodation proof'),
      ],
    );
  }

  // Content for Customs
  Widget _buildCustomsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        const Text(
          'Items to Declare:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        _buildBulletPoint('Cash over USD 10,000 equivalent'),
        _buildBulletPoint('More than 1 liter of alcohol'),
        _buildBulletPoint('More than 200 cigarettes'),
        _buildBulletPoint('Electronics for commercial purposes'),
        _buildBulletPoint('Restricted medications'),
        const SizedBox(height: 12),
        const Text(
          'Prohibited Items:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),
        ),
        const SizedBox(height: 8),
        _buildBulletPoint('Narcotics and illegal drugs'),
        _buildBulletPoint('Firearms and explosives'),
        _buildBulletPoint('Pornographic materials'),
        _buildBulletPoint('Chinese traditional medicines'),

        const SizedBox(height: 8),
        _buildClickableLinkRow(
          Icons.computer,
          'For more info, visit',
          'https://ecd.beacukai.go.id',
        ),
      ],
    );
  }





 // Clickable link function 
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




    // Function to launch URL
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







// Info row widget
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





// Bullet point widget
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






  // Important reminder widget
  Widget _buildImportantReminder() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.red.shade300,
                size: 28,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Important Reminder',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2A4F),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Please remember all information provided is a guide only. Always check official government sources before you travel.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.shade100),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.block, color: Colors.red.shade300, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Avoid unofficial agents or websites claiming to "fast-track" visas, They often charge inflated fees or provide outdated information.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.4,
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




    // Content for Golden Visa & Other Options
  Widget _buildGoldenVisaContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        const Text(
          'Indonesia now offers several new categories (such as Golden Visa, Digital Nomad, or Investment Visas).',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        _buildBulletPoint('These have specific financial or sponsorship requirements'),
        _buildBulletPoint('Best suited for long-term residents, investors, or business owners'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.handshake_sharp, color: Colors.red[700], size: 20),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Golden Visa Benefits',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                '5 or 10-year stay permits for qualified investors and their families',
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildClickableLinkRow(
          Icons.info_outline,
          'Learn more',
          'https://www.imigrasi.go.id/en/visa/',
        ),
      ],
    );
  }
}