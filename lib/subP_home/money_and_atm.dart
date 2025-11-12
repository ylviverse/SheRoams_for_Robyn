import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:she_roams_bali/subP_home/money_atm_subpage/currency_exchange.dart';
import 'package:url_launcher/url_launcher.dart';

class MoneyAndAtm extends StatefulWidget {
  const MoneyAndAtm({super.key});

  @override
  State<MoneyAndAtm> createState() => _MoneyAndAtmState();
}

class _MoneyAndAtmState extends State<MoneyAndAtm> {
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
          'Money and ATMs',
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
            'Money & Banking',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Managing money in Bali',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),

          // Currency Exchange (Navigate to separate page)
          _buildNavigationItem(
            context,
            icon: Icons.currency_exchange,
            title: 'Currency Exchange',
            subtitle: 'Checking rates and tips',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrencyExchange(),
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          // Expandable sections
          _buildExpandableItem(
            icon: Icons.atm,
            title: 'Reliable ATMs',
            subtitle: 'Finding safe ATMs in Bali',
            sectionKey: 'atm',
            content: _buildATMContent(),
          ),

          const SizedBox(height: 12),

          _buildExpandableItem(
            icon: Icons.credit_card,
            title: 'Cards & Payment',
            subtitle: 'Using credit/debit cards',
            sectionKey: 'cards',
            content: _buildCardsContent(),
          ),

          const SizedBox(height: 12),

          _buildExpandableItem(
            icon: Icons.account_balance,
            title: 'Banks',
            subtitle: 'Major banks and services',
            sectionKey: 'banks',
            content: _buildBanksContent(),
          ),

          const SizedBox(height: 12),

          _buildExpandableItem(
            icon: Icons.payments,
            title: 'Money Exchange Safety',
            subtitle: 'Tips and trusted changers',
            sectionKey: 'safety',
            content: _buildSafetyContent(),
          ),

          const SizedBox(height: 24),

          // Affiliate Disclaimer
          _buildAffiliateDisclaimer(),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
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
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[800], size: 28),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildExpandableItem({
    required IconData icon,
    required String title,
    required String subtitle,
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
            leading: Icon(icon, color: Colors.grey[800], size: 28),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
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

  Widget _buildATMContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),

        _buildSectionHeader('💳 ATM Fees & Currency Choice'),
        const SizedBox(height: 12),

        _buildInfoText(
          'When withdrawing cash or paying by card in Bali, it\'s easy to lose extra money through hidden conversion or ATM fees — here\'s what to expect and how to avoid it:',
        ),
        
        const SizedBox(height: 12),

        _buildBulletPoint('Local banks (BCA, BNI, Mandiri, CIMB): Rp 25,000 – Rp 35,000 per withdrawal (≈ \$2.50 – \$3.50)'),
        _buildBulletPoint('Smaller regional banks: May charge up to Rp 50,000 (≈ \$5)'),
        _buildBulletPoint('Your home bank\'s overseas fee: Usually 1.5 – 3% per transaction'),
        _buildBulletPoint('Travel/prepaid cards (Wise, Revolut, etc.): Many offer free monthly withdrawals up to a limit'),

        const SizedBox(height: 16),

        _buildTipBox(
          'Withdraw larger amounts less often to reduce per-transaction fees — but keep most cash locked away safely.',
        ),

        const SizedBox(height: 16),

        _buildSectionHeader('🌍 Always Choose "Charge in IDR" (Local Currency)'),
        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade200),
          ),
          child: const Text(
            '"Charge in your home currency or in Indonesian Rupiah (IDR)?"',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 12),

        _buildInfoText(
          'Always select IDR (the local currency). Choosing your home currency lets the merchant or ATM apply Dynamic Currency Conversion (DCC), which can add 3–8% extra cost without you realising.',
        ),

        const SizedBox(height: 12),

        _buildTipBox(
          'Remember: Your card provider already converts at fairer mid-market rates, so DCC is almost never the better choice.',
          color: Colors.amber,
        ),

        const SizedBox(height: 16),

        _buildSectionHeader('👮 Security Officer Tip'),
        const SizedBox(height: 12),

        _buildInfoText(
          'At most reputable banks, there will be a uniformed security officer near the ATM area. If you ever feel uncertain, politely ask the guard to stand nearby or outside the ATM area while you withdraw. They are trained to assist customers and help deter unwanted attention.',
        ),
      ],
    );
  }

    Widget _buildCardsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),

        _buildSectionHeader('💳 Travel & Prepaid Cards'),
        const SizedBox(height: 12),

        _buildCardItem(
          name: 'Wise Travel Card',
          description: 'Hold and spend multiple currencies; lowest conversion fees',
          url: 'https://wise.com',
        ),

        _buildCardItem(
          name: 'Revolut Card',
          description: 'Exchange instantly at live rates; app management',
          url: 'https://revolut.com',
        ),

        _buildCardItem(
          name: 'Travelex Money Card',
          description: 'Lock in exchange rates before travel',
          url: 'https://www.travelex.com',
        ),

        _buildCardItem(
          name: 'Visa TravelMoney',
          description: 'Accepted worldwide; emergency replacement',
          url: 'https://www.visa.com',
        ),
      ],
    );
  }

  Widget _buildBanksContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),

        _buildSectionHeader('🏦 Reputable Banks in Bali'),
        const SizedBox(height: 12),

        _buildInfoText(
          'Use ATMs and branches belonging to major, Bank Indonesia-licensed banks. They are secure, regularly monitored, and have English-language ATM options.',
        ),

        const SizedBox(height: 16),

        _buildBankItem(
          name: 'Bank Central Asia (BCA)',
          description: 'Largest retail bank in Indonesia; trusted, easy to find, wide 24-hour network',
          areas: 'Denpasar, Kuta, Seminyak, Ubud, Canggu, Nusa Dua',
        ),

        _buildBankItem(
          name: 'Bank Mandiri',
          description: 'State-owned with good foreign-card compatibility',
          areas: 'Airport arrivals, malls, tourist hubs',
        ),

        _buildBankItem(
          name: 'Bank Negara Indonesia (BNI)',
          description: 'Reliable service, English menus, works well with Visa/Mastercard',
          areas: 'Ubud, Sanur, Seminyak, Canggu',
        ),

        _buildBankItem(
          name: 'Bank Rakyat Indonesia (BRI)',
          description: 'Extensive rural network; smaller withdrawal limits but reliable',
          areas: 'Island-wide',
        ),

        _buildBankItem(
          name: 'CIMB Niaga',
          description: 'Low fees for some international withdrawals',
          areas: 'Seminyak, Jimbaran, Legian',
        ),

        _buildBankItem(
          name: 'Permata Bank',
          description: 'Good tech support and fraud protection',
          areas: 'Major tourist zones',
        ),

        _buildBankItem(
          name: 'Maybank Indonesia',
          description: 'Malaysian-linked bank; strong security standards',
          areas: 'Tourist centres & malls',
        ),

        const SizedBox(height: 16),

        _buildTipBox(
          'ATMs inside bank buildings or attached to branches are always safer.',
        ),
      ],
    );
  }

  Widget _buildSafetyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 16),

        _buildSectionHeader('🌴 The Golden Rule'),
        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade200, width: 2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.warning_amber, color: Colors.red.shade700, size: 24),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'If the exchange rate sounds too good to be true — it probably is. Scams often appear at small roadside changers with unusually high rates.',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        _buildSectionHeader('💰 Recognising a Trustworthy Money Changer'),
        const SizedBox(height: 12),

        const Text(
          'Look for:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),

        _buildBulletPoint('\'Authorised by Bank Indonesia\' signage', icon: Icons.check_circle, color: Colors.green),
        _buildBulletPoint('Digital or printed exchange-rate board with clear buy/sell rates', icon: Icons.check_circle, color: Colors.green),
        _buildBulletPoint('Printed receipt showing the rate, date, and amount exchanged', icon: Icons.check_circle, color: Colors.green),
        _buildBulletPoint('Clean, bright workspace, CCTV, and uniformed staff', icon: Icons.check_circle, color: Colors.green),
        _buildBulletPoint('Location in busy, visible areas — not hidden lanes', icon: Icons.check_circle, color: Colors.green),

        const SizedBox(height: 12),

        const Text(
          'Avoid:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),

        _buildBulletPoint('Unrealistically high rates', icon: Icons.cancel, color: Colors.red),
        _buildBulletPoint('No receipt or \'back-room counting\'', icon: Icons.cancel, color: Colors.red),
        _buildBulletPoint('Staff \'helping\' to recount money out of sight', icon: Icons.cancel, color: Colors.red),

        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.verified, color: Colors.green.shade700, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Trusted Names: Central Kuta Money Exchange, BMC Money Changer, Dirgahayu Valuta Prima, PT Dwi Indah Valasindo',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAffiliateDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink.shade50,
            Colors.orange.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFefa355).withValues(alpha: .3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('🌺', style: TextStyle(fontSize: 24)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Affiliate Disclosure',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'To help keep She Roams free and accessible, we may earn a small commission from certain products or services you purchase via our app or website. This comes at no additional cost to you — we\'re supported directly by our trusted third-party partners.',
            style: TextStyle(fontSize: 13, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, height: 1.5),
    );
  }

  Widget _buildBulletPoint(String text, {IconData? icon, Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon ?? Icons.circle,
            size: icon != null ? 16 : 6,
            color: color ?? Colors.grey[700],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipBox(String text, {Color? color}) {
    final boxColor = color ?? Colors.green;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline, color: boxColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem({
    required String name,
    required String description,
    required String url,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _launchURL(url),
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankItem({
    required String name,
    required String description,
    required String areas,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 14, color: Colors.grey[700]),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    areas,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }




  //this method launches url and shows snackbar on error
 Future<void> _launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  await launchUrl(url);
}
}