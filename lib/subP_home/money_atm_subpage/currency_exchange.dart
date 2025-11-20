import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({super.key});

  @override
  State<CurrencyExchange> createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  Map<String, dynamic>? exchangeRates;
  bool isLoading = true;
  String? errorMessage;
  
  // Converter state
  final TextEditingController _amountController = TextEditingController(text: '0');
  String _fromCurrency = 'USD';
  double _convertedAmount = 0;

  final List<Map<String, String>> currencies = [
    {'code': 'USD', 'name': 'US Dollar', 'flag': '🇺🇸'},
    {'code': 'EUR', 'name': 'Euro', 'flag': '🇪🇺'},
    {'code': 'GBP', 'name': 'British Pound', 'flag': '🇬🇧'},
    {'code': 'AUD', 'name': 'Australian Dollar', 'flag': '🇦🇺'},
    {'code': 'SGD', 'name': 'Singapore Dollar', 'flag': '🇸🇬'},
    {'code': 'JPY', 'name': 'Japanese Yen', 'flag': '🇯🇵'},
    {'code': 'CNY', 'name': 'Chinese Yuan', 'flag': '🇨🇳'},
    {'code': 'KRW', 'name': 'South Korean Won', 'flag': '🇰🇷'},
  ];

  @override
  void initState() {
    super.initState();
    fetchExchangeRates();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> fetchExchangeRates() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await http.get(
        Uri.parse('https://api.exchangerate-api.com/v4/latest/USD'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          exchangeRates = data['rates'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load exchange rates');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Could not fetch exchange rates';
        isLoading = false;
      });
    }
  }

  void _convertCurrency() {
    if (exchangeRates == null) return;
    
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (amount == 0) {
      setState(() => _convertedAmount = 0);
      return;
    }

    // Convert from source currency to USD, then to IDR
    final fromRate = exchangeRates![_fromCurrency] ?? 1.0;
    final idrRate = exchangeRates!['IDR'] ?? 1.0;
    
    final amountInUSD = amount / fromRate;
    final converted = amountInUSD * idrRate;
    
    setState(() => _convertedAmount = converted);
  }

  String _formatNumber(double number) {
    if (number >= 1000000) {
      return number.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
    } else if (number >= 1000) {
      return number.toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
    } else if (number < 1) {
      return number.toStringAsFixed(4);
    } else {
      return number.toStringAsFixed(2);
    }
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
          'Currency Converter',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: fetchExchangeRates,
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFFF7A5A5)),
            )
          : errorMessage != null
              ? _buildErrorState()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Convert to IDR',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Live exchange rates',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // From Currency
                      _buildCurrencyInput(
                        label: 'Amount',
                        controller: _amountController,
                        selectedCurrency: _fromCurrency,
                        onCurrencyChanged: (value) {
                          setState(() {
                            _fromCurrency = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 24),

                      // Convert Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _convertCurrency,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF7A5A5).withValues(alpha: .6),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.sync_alt, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Convert',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // To Currency (IDR only)
                      _buildCurrencyOutput(
                        label: 'Indonesian Rupiah',
                        amount: _convertedAmount,
                      ),

                      const SizedBox(height: 32),

                      // Exchange Rate Info
                      _buildRateInfo(),

                      const SizedBox(height: 24),

                      // Tips
                      _buildTipsSection(),
                    ],
                  ),
                ),
    );
  }

  Widget _buildCurrencyInput({
    required String label,
    required TextEditingController controller,
    required String selectedCurrency,
    required ValueChanged<String?> onCurrencyChanged,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '0',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _buildCurrencyDropdown(selectedCurrency, onCurrencyChanged),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyOutput({
    required String label,
    required double amount,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7A5A5).withValues(alpha: .1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFefa355).withValues(alpha: .3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  _formatNumber(amount),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF7A5A5),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('🇮🇩', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 8),
                    Text(
                      'IDR',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyDropdown(String selectedCurrency, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selectedCurrency,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down, size: 20),
        onChanged: onChanged,
        items: currencies.map((currency) {
          return DropdownMenuItem<String>(
            value: currency['code'],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(currency['flag']!, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 8),
                Text(
                  currency['code']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRateInfo() {
    if (exchangeRates == null) return const SizedBox.shrink();

    final fromRate = exchangeRates![_fromCurrency] ?? 1.0;
    final idrRate = exchangeRates!['IDR'] ?? 1.0;
    final rate = idrRate / fromRate;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFB0CE88),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, color: Colors.black, size: 20),
          const SizedBox(width: 8),
          Text(
            '1 $_fromCurrency = ${_formatNumber(rate)} IDR',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFefa355).withValues(alpha: .1),
            const Color(0xFFF7A5A5).withValues(alpha: .1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF7A5A5).withValues(alpha: .2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.lightbulb_outline, color: Color(0xFF31694E)),
              SizedBox(width: 8),
              Text(
                'Exchange Tips',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF31694E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTipItem('Use authorized money changers (Central Kuta, BMC)'),
          _buildTipItem('Count your money before leaving the counter'),
          _buildTipItem('Airport rates are typically 5-10% lower'),
          _buildTipItem('Keep small bills for markets and taxis'),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 18, color: Color(0xFF31694E)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
            const SizedBox(height: 16),
            Text(
              errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: fetchExchangeRates,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF7A5A5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}