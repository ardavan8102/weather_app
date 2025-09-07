import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}