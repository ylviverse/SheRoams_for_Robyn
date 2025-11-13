import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Bali coordinates (Denpasar)
  static const double latitude = -8.6705;
  static const double longitude = 115.2126;
  
  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  String? errorMessage;
  DateTime? lastUpdated;
  String? expandedSection;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Open-Meteo API endpoint 
      final url = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&timezone=Asia%2FJakarta',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
          lastUpdated = DateTime.now();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Could not fetch weather data. Please try again.';
        isLoading = false;
      });
    }
  }

  // WMO Weather interpretation codes
  Map<String, dynamic> getWeatherInfo(int code) {
    if (code == 0) {
      return {'icon': '☀️', 'description': 'Clear sky', 'main': 'Clear'};
    } else if (code <= 3) {
      return {'icon': '🌤️', 'description': 'Partly cloudy', 'main': 'Clouds'};
    } else if (code <= 48) {
      return {'icon': '🌫️', 'description': 'Foggy', 'main': 'Fog'};
    } else if (code <= 67) {
      return {'icon': '🌧️', 'description': 'Rainy', 'main': 'Rain'};
    } else if (code <= 77) {
      return {'icon': '🌨️', 'description': 'Snowy', 'main': 'Snow'};
    } else if (code <= 82) {
      return {'icon': '🌧️', 'description': 'Rain showers', 'main': 'Rain'};
    } else if (code <= 86) {
      return {'icon': '🌨️', 'description': 'Snow showers', 'main': 'Snow'};
    } else {
      return {'icon': '⛈️', 'description': 'Thunderstorm', 'main': 'Thunderstorm'};
    }
  }

  Color getWeatherGradientStart(String weatherMain) {
    switch (weatherMain.toLowerCase()) {
      case 'clear':
        return const Color(0xFFFFA726);
      case 'clouds':
        return const Color(0xFF78909C);
      case 'rain':
      case 'thunderstorm':
        return const Color(0xFF5C6BC0);
      case 'fog':
        return const Color(0xFF90A4AE);
      default:
        return const Color(0xFF4A90E2);
    }
  }

  Color getWeatherGradientEnd(String weatherMain) {
    switch (weatherMain.toLowerCase()) {
      case 'clear':
        return const Color(0xFFFFB74D);
      case 'clouds':
        return const Color(0xFF90A4AE);
      case 'rain':
      case 'thunderstorm':
        return const Color(0xFF7986CB);
      case 'fog':
        return const Color(0xFFB0BEC5);
      default:
        return const Color(0xFF50B8E7);
    }
  }

  String getTimeAgo() {
    if (lastUpdated == null) return 'just now';
    
    final now = DateTime.now();
    final difference = now.difference(lastUpdated!);
    
    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return 'today';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F6),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Weather Overview',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF9F8F6),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: fetchWeather,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchWeather,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Weather Card
            if (isLoading)
              _buildLoadingCard()
            else if (errorMessage != null)
              _buildErrorCard()
            else
              _buildWeatherCard(),

            const SizedBox(height: 24),

            const Text(
              'Plan Your Visit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Best time to visit Bali',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // Expandable Categories
            _buildExpandableItem(
              icon: Icons.wb_sunny,
              title: 'Best Season to Visit',
              sectionKey: 'season',
              content: _buildSeasonContent(),
            ),
            
            const SizedBox(height: 12),
            
            _buildExpandableItem(
              icon: Icons.checkroom_sharp,
              title: 'What to Pack',
              sectionKey: 'packing',
              content: _buildPackingContent(),
            ),
          ],
        ),
      ),
    );
  }


  // Expandable Item Builder for Categories
    Widget _buildExpandableItem({
    required IconData icon,
    required String title,
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



  // Season Content
  Widget _buildSeasonContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        
        _buildSeasonCard(
          season: 'Dry Season (Best)',
          months: 'May - October',
          icon: '☀️',
          color: Colors.orange,
          description: 'Perfect weather for beach activities and exploring',
          features: [
            'Sunny days, low humidity',
            'Ideal for surfing & diving',
            'Best for temple visits',
            'Peak tourist season (July-August)',
          ],
        ),
        
        const SizedBox(height: 18),
        
        _buildSeasonCard(
          season: 'Wet Season',
          months: 'November - April',
          icon: '🌧️',
          color: Colors.blue,
          description: 'Occasional rain, lush green landscapes',
          features: [
            'Short afternoon showers',
            'Fewer tourists, better deals',
            'Great for rice terrace views',
            'Still warm (24-30°C)',
          ],
        ),
        
        const SizedBox(height: 16),
        
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.tips_and_updates, color: Colors.green.shade700, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Best months: May, June, September (great weather, fewer crowds)',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }



  // Season Card Builder or container
  Widget _buildSeasonCard({
    required String season,
    required String months,
    required String icon,
    required Color color,
    required String description,
    required List<String> features,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: .3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    season,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color.withValues(alpha: 1),
                    ),
                  ),
                  Text(
                    months,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 12),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle, size: 16, color: color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    feature,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }




  // What to Pack Content
  Widget _buildPackingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1),
        const SizedBox(height: 12),
        
        _buildPackingCategory(
          title: 'Essentials',
          icon: Icons.backpack,
          color: const Color(0xFFefa355),
          items: [
            'Light, breathable clothing',
            'Swimwear & beach cover-up',
            'Sandals & comfortable walking shoes',
            'Sun protection (SPF 50+, hat, sunglasses)',
            'Insect repellent',
            'Reusable water bottle',
          ],
        ),
        
        const SizedBox(height: 16),
        
        _buildPackingCategory(
          title: 'Temple Visits',
          icon: Icons.temple_hindu,
          color: Colors.purple,
          items: [
            'Sarong (or rent at temples)',
            'Modest clothing (cover shoulders & knees)',
            'Light scarf for head covering',
          ],
        ),
        
        const SizedBox(height: 16),
        
        _buildPackingCategory(
          title: 'Rainy Season Extra',
          icon: Icons.umbrella,
          color: Colors.blue,
          items: [
            'Light rain jacket',
            'Quick-dry clothes',
            'Waterproof bag for electronics',
          ],
        ),
        
        const SizedBox(height: 16),
        
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.warning_amber, color: Colors.red.shade700, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Don\'t pack: Heavy jeans, thick sweaters. Bali is tropical year-round (24-30°C)',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  // Packing Category Builder
  Widget _buildPackingCategory({
    required String title,
    required IconData icon,
    required Color color,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 6, left: 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }



  // Loading Card Widget
  Widget _buildLoadingCard() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4A90E2), Color(0xFF50B8E7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: .3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }



  // error handling card
  Widget _buildErrorCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade400, size: 48),
          const SizedBox(height: 12),
          Text(
            errorMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: fetchWeather,
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }



  // Weather Card Widget
  Widget _buildWeatherCard() {
    final current = weatherData?['current'];
    
    final temp = current?['temperature_2m']?.round() ?? 0;
    final feelsLike = current?['apparent_temperature']?.round() ?? 0;
    final humidity = current?['relative_humidity_2m'] ?? 0;
    final windSpeed = current?['wind_speed_10m']?.toStringAsFixed(1) ?? '0';
    final weatherCode = current?['weather_code'] ?? 0;
    
    final weatherInfo = getWeatherInfo(weatherCode);
    final weatherIcon = weatherInfo['icon'];
    final weatherDescription = weatherInfo['description'];
    final weatherMain = weatherInfo['main'];
    
    final gradientStart = getWeatherGradientStart(weatherMain);
    final gradientEnd = getWeatherGradientEnd(weatherMain);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradientStart.withValues(alpha: .3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bali, Indonesia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Updated ${getTimeAgo()}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Text(
                weatherIcon,
                style: const TextStyle(fontSize: 50),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$temp°C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherDescription,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Feels like $feelsLike°C',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildWeatherDetail(Icons.water_drop, '$humidity%', 'Humidity'),
                  const SizedBox(height: 8),
                  _buildWeatherDetail(Icons.air, '$windSpeed km/h', 'Wind'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }



  // Weather Detail Row Builder
  Widget _buildWeatherDetail(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}