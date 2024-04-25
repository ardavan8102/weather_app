class Weather {
  

  final String cityName;
  final double temprature;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.mainCondition,
    required this.temprature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'], 
      mainCondition: json['main']['temp'].toDouble(), 
      temprature: json['weather'][0]['main'],
    );
  }
}