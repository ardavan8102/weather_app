import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/helpers/helper_functions.dart';
import 'package:weather_app/widgets/home/main_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dark = myHelperFunctions.isDarkMode(context);
    int currentIndex = 0;

    return Scaffold(
      backgroundColor: dark ? myColors.darkContainer : myColors.primaryBackground,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          selectedIndex: currentIndex,
          backgroundColor: Colors.transparent,
          activeColor: myColors.white,
          tabBackgroundColor: dark ? Colors.grey.shade800 : Colors.blue.shade200,
          padding: EdgeInsets.all(16),
          gap: 10,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: myColors.white,
              text: 'Home',
            ),
            GButton(
              icon: Icons.cloud,
              iconColor: myColors.white,
              text: 'Weather',
            ),
            GButton(
              icon: Icons.location_city,
              iconColor: myColors.white,
              text: 'My City',
            ),
            GButton(
              icon: Icons.question_mark,
              iconColor: myColors.white,
              text: 'About',
            ),
          ],
        ),
      ),
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
