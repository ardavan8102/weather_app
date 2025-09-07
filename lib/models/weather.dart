class Weather {
  final String city;
  final String weatherStatus;
  final String description;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double windSpeed;
  final int humidity;
  final int pressure;
  final int groundLevelTemp;

  Weather({
    required this.groundLevelTemp,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.city,
    required this.description,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.weatherStatus,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    var weatherData = json['weather'];

    // Ensure weather is a non-null, non-empty list
    if (weatherData != null && weatherData.isNotEmpty) {
      return Weather(
        city: json['name'], // City name
        description: weatherData[0]['description'] ?? 'No description', // Weather description
        temperature: json['main']['temp']?.toDouble() ?? 0.0, // in Fahrenheit
        minTemperature: json['main']['temp_min']?.toDouble() ?? 0.0,
        maxTemperature: json['main']['temp_max']?.toDouble() ?? 0.0,
        weatherStatus: weatherData[0]['main'] ?? 'No status', 
        humidity: json['main']['humidity'] ?? 'No Data',
        windSpeed: json['wind']['speed'] ?? 'No Data',
        pressure: json['main']['pressure'] ?? 'No Data',
        groundLevelTemp: json['main']['grnd_level'] ?? 'No Data',
      );
    } else {
      throw Exception("Weather data is malformed or empty");
    }
  }
}