import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/constants/sizes.dart';
import 'package:weather_app/utils/helpers/helper_functions.dart';
import 'package:weather_app/widgets/home/main_animation.dart';
import 'package:weather_app/widgets/home/todays_weather_card.dart';
import 'package:weather_app/widgets/home/weekdays_degree_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = myHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor:
          dark ? myColors.darkContainer : myColors.primaryBackground,
      body: Container(
        child: Column(
          children: [
            // -- Top side animations
            homeTopAnimation(),

            // --  Today's weather schedule
            todaysWeatherWidget(context: context, dark: dark),

            // -- Weather in days of week
            SizedBox(height: mySizes.spaceBetweenSections),

            degreeOfDaysWidget(context: context, dark: dark),
          ],
        ),
      ),
    );
  }
}