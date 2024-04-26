import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/get_started.dart';
import 'package:weather_app/utils/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: myAppTheme.lightTheme,
      darkTheme: myAppTheme.darkTheme,
      home: const GetStarted(),
    );
  }
}
