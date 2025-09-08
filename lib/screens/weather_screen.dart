import 'package:HavaYab/extentions/string_extenction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:HavaYab/providers/weather_provider.dart';

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
                onSubmitted: (_) {
                  weatherProvider.fetchWeather(_cityController.text);
                },
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
                      // Overall Stats
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.2,
                            image: AssetImage('assets/images/bubbles.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withValues(alpha: 0.1),
                              BlendMode.darken,
                            ),
                          ),
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(18)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${weatherProvider.weather!.city} - ${
                                    weatherProvider.weather!.weatherStatus
                                  }",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              
                                Text(
                                  weatherProvider.weather!.description.capitalize(),
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.7),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Row 1 => Temperature & Humidity
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(18),
                              width: (MediaQuery.of(context).size.width / 2) - 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: 0.1,
                                  image: AssetImage('assets/images/bubbles.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.1),
                                    BlendMode.overlay,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade500,
                                    Colors.blue.shade100,
                                  ],
                                  begin: FractionalOffset(1.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.5, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "دمای فعلی",
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.7),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${((weatherProvider.weather!.temperature - 32) / 1.8).round()} °C",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IranYekan',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 40.0,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(18),
                              width: (MediaQuery.of(context).size.width / 2) - 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: 0.1,
                                  image: AssetImage('assets/images/bubbles.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.1),
                                    BlendMode.overlay,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green.shade500,
                                    Colors.green.shade100,
                                  ],
                                  begin: FractionalOffset(1.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.5, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "رطوبت هوا",
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.7),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${weatherProvider.weather!.humidity}%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IranYekan',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 40.0,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Row 2 => Min - Max temperature
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(18),
                              width: (MediaQuery.of(context).size.width / 2) - 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: 0.1,
                                  image: AssetImage('assets/images/bubbles.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.1),
                                    BlendMode.overlay,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.orange.shade500,
                                    Colors.orange.shade100,
                                  ],
                                  begin: FractionalOffset(1.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.5, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "حداقل دما",
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.7),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${((weatherProvider.weather!.minTemperature - 32) / 1.8).toStringAsFixed(2)} °C",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IranYekan',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32.0,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(18),
                              width: (MediaQuery.of(context).size.width / 2) - 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: 0.1,
                                  image: AssetImage('assets/images/bubbles.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.1),
                                    BlendMode.overlay,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.deepOrange.shade500,
                                    Colors.deepOrange.shade100,
                                  ],
                                  begin: FractionalOffset(1.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.5, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "حداکثر دما",
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.7),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${((weatherProvider.weather!.maxTemperature - 32) / 1.8).toStringAsFixed(2)} °C",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IranYekan',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32.0,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                      // Row 3
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(18),
                              width: (MediaQuery.of(context).size.width / 2) - 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: 0.1,
                                  image: AssetImage('assets/images/bubbles.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.1),
                                    BlendMode.overlay,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.shade500,
                                    Colors.purple.shade100,
                                  ],
                                  begin: FractionalOffset(1.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.5, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "فشار",
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.7),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${weatherProvider.weather!.pressure} میلی بار",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IranYekan',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(18),
                              width: (MediaQuery.of(context).size.width / 2) - 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: 0.1,
                                  image: AssetImage('assets/images/bubbles.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withValues(alpha: 0.1),
                                    BlendMode.overlay,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pink.shade500,
                                    Colors.pink.shade100,
                                  ],
                                  begin: FractionalOffset(1.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.5, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "سرعت باد",
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.7),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${weatherProvider.weather!.windSpeed} KM/H",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IranYekan',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 24),
                        padding: EdgeInsets.all(18),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.1,
                            image: AssetImage('assets/images/bubbles.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withValues(alpha: 0.1),
                              BlendMode.overlay,
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey.shade500,
                              Colors.blueGrey.shade100,
                            ],
                            begin: FractionalOffset(1.0, 0.0),
                            end: FractionalOffset(0.0, 1.0),
                            stops: [0.5, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "مقدار سطح زمین",
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${weatherProvider.weather!.groundLevelTemp} متر",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'IranYekan',
                                fontWeight: FontWeight.w700,
                                fontSize: 32.0,
                              ),
                            ),

                          ],
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