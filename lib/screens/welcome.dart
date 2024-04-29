import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/helpers/helper_functions.dart';
import 'package:weather_app/widgets/appbar.dart';
import 'package:weather_app/widgets/bottom_nav_bar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    final dark = myHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? myColors.dark : myColors.primaryBackground,
      appBar: MainAppBar(),
      bottomNavigationBar: MainNavBar(),
    );
  }

  
}
