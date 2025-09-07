class Weather {
  final String city;
  final String decsription;
  final double temperature;
  
  Weather({
    required this.city,
    required this.decsription,
    required this.temperature
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      city: json['name'], 
      decsription: json['weather']['0']['description'], 
      temperature: json['main']['temp'],
    );
  }
}