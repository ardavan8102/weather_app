import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/screens/about.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/specific_city_weather.dart';
import 'package:weather_app/screens/weather.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  PageController _pageController = new PageController();

  int _currentIndex = 0;
  List<Widget> _screens = [
    HomePage(),
    WeatherPage(),
    MyCityPage(),
    AboutPage(),
  ];

  void _onPagedChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final dark = myHelperFunctions.isDarkMode(context);
    
    return Scaffold(
      backgroundColor: dark ? myColors.dark : Color.fromARGB(255, 169, 177, 216),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          selectedIndex: _currentIndex,
          backgroundColor: Colors.transparent,
          activeColor: myColors.white,
          tabBackgroundColor: dark ? Colors.grey.shade800 : Colors.blue.shade200,
          padding: EdgeInsets.all(16),
          gap: 10,
          onTabChange: (index) => _onItemTapped(index),
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
              text: 'Cities',
            ),
            GButton(
              icon: Icons.question_mark,
              iconColor: myColors.white,
              text: 'About',
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPagedChanged,
      )
    );
  }
}
