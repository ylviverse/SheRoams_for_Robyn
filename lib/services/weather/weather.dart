import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  // Get your free API key from: https://openweathermap.org/api
  static const String apiKey = 'YOUR_API_KEY_HERE';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  
  // Bali coordinates
  static const double latitude = -8.3405;
  static const double longitude = 115.0920;

  Future<Map<String, dynamic>> getWeather() async {
    final url = Uri.parse(
      '$baseUrl?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey'
    );

    try {
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}