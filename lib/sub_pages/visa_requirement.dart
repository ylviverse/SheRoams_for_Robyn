import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
            title: 'Extension Process',
            sectionKey: 'extension',
            content: _buildExtensionContent(),
          ),
          _buildExpandableItem(
            title: 'Custom Declaration',
            sectionKey: 'customs',
            content: _buildCustomsContent(),
          ),
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
              color: Colors.grey.withOpacity(0.1),
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
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: const [
              Icon(Icons.info_outline, color: Colors.blue, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Best for tourists planning to stay 30-60 days',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
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
        _buildInfoRow(Icons.public, 'Eligible countries', '169 countries including US, UK, EU, Australia'),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.flight_takeoff, 'Entry points', 'Selected airports and seaports only'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: const [
              Icon(Icons.warning_amber, color: Colors.orange, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Cannot be extended. Must leave after 30 days',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
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
        _buildInfoRow(Icons.computer, 'Apply online', 'molina.imigrasi.go.id'),
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
      ],
    );
  }

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
}