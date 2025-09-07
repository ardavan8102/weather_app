import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String _errorMessage = '';
  final WeatherService _weatherService = WeatherService();

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = ''; // Clear previous errors
    notifyListeners();

    try {
      final data = await _weatherService.fetchWeather(city);
      _weather = Weather.fromJson(data);
    } catch (e) {
      _errorMessage = e.toString();  // Capture the error
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}