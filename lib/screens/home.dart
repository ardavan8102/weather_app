import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // api key
  final _weatherService = WeatherService(
    '1446b9c6b25f5a5f978726164c203ae5'
  );
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // Get current city
    String cityName = await _weatherService.getCurrentCity();

    // Get weather for the city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    // any errors
    } catch (e) {
      print(e);
    }
  }


  // weather animations 

  // initialize state
  @override
  void initState() {
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}