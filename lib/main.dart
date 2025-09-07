import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:HavaYab/providers/weather_provider.dart';
import 'package:HavaYab/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        locale: Locale('fa', 'IR'),
        debugShowCheckedModeBanner: false,
        title: 'Hava Yab',
        theme: ThemeData(
          fontFamily: 'Estedad',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}