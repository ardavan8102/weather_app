import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: "Enter City",
                suffixIcon: IconButton(
                  onPressed: () {
                    weatherProvider.fetchWeather(_cityController.text);
                  }, 
                  icon: Icon(Icons.search),
                )
              ),
            ),

            SizedBox(height: 20),

            weatherProvider.isLoading
              ?CircularProgressIndicator()
              : weatherProvider.weather == null
                ? Text('No Data Available')
                : Column(
                  children: [
                    Text(
                      weatherProvider.weather!.city,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      weatherProvider.weather!.decsription,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),

                    Text(
                      "${weatherProvider.weather!.temperature} F",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                )
          ],
        ),
      ),

    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}