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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SafeArea(
            // margin: EdgeInsets.only(top: 10),
            top: false,
            minimum: EdgeInsets.only(top: 10),
            child: AppBar(
              title: Text('هوا یاب'),
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {}, 
                          icon: Icon(
                            Icons.question_mark_rounded,
                            color: Colors.blueAccent,
                          )
                        ),
                      ),
            
                      SizedBox(width: 12),
            
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {}, 
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18
                ),
                maxLength: 155,
                maxLines: 1,
                controller: _cityController,
                decoration: InputDecoration(
                  counterText: "", // Hide Counter text
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  label: Text('نام شهر'),
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
                  ? Text(weatherProvider.errorMessage.isNotEmpty
                    ? weatherProvider.errorMessage
                    : 'هنوز شهری انتخاب نکردید',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  : Column(
                    children: [
                      Text(
                        "${weatherProvider.weather!.city} - ${weatherProvider.weather!.weatherStatus}",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
      
                      Text(
                        weatherProvider.weather!.description,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
      
                      Text(
                        "${((weatherProvider.weather!.temperature - 32) / 1.8).round()} °C",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
      
                      Text(
                        "Humidity : ${weatherProvider.weather!.humidity}%",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
      
                      Text(
                        "Minimum : ${((weatherProvider.weather!.minTemperature - 32) / 1.8).toStringAsFixed(2)} °C",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
      
                      Text(
                        "Maximum : ${((weatherProvider.weather!.maxTemperature - 32) / 1.8).toStringAsFixed(2)} °C",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
      
                      Text(
                        "Wind Speed : ${weatherProvider.weather!.windSpeed} KM/H",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
      
                      Text(
                        "Pressure : ${weatherProvider.weather!.pressure} Millibars",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
      
                      Text(
                        "Ground Level : ${weatherProvider.weather!.groundLevelTemp} Meters",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  )
            ],
          ),
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