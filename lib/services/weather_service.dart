import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '1446b9c6b25f5a5f978726164c203ae5';
  final String baseURL = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$baseURL?q=$city&appid=$apiKey&units=imperial'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("شهر مورد نظر یافت نشد");
    }

  }
}