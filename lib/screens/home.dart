import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/helpers/helper_functions.dart';
import 'package:weather_app/widgets/home/main_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = myHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? myColors.darkContainer : myColors.primaryBackground,
      body: Container(
        child: Column(
          children: [
            // -- Top side animations
            homeTopAnimation()
          ],
        ),
      ),
    );
  }
}