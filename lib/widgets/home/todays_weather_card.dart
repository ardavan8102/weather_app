import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/constants/image_strings.dart';
import 'package:weather_app/utils/constants/sizes.dart';
import 'package:weather_app/utils/device/device_utility.dart';

class todaysWeatherWidget extends StatelessWidget {
  const todaysWeatherWidget({
    super.key,
    required this.context,
    required this.dark,
  });

  final BuildContext context;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: dark ? myColors.dark : myColors.grey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: dark ? myColors.primaryBackground : myColors.primary,
              width: 4),
        ),
        width: myDeviceUtilities.getScreenWidth(context),
        height: myDeviceUtilities.getScreenHeight() * 0.25,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: mySizes.spaceBetweenItems + 10),

              // -- Title and divider
              Text(
                'Tuesday',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              Divider(
                height: 30,
                color: dark ? myColors.white : myColors.dark,
                thickness: 3,
                endIndent: 50,
                indent: 50,
              ),

              // -- Weather info
              Container(
                height: 50,
                width: myDeviceUtilities.getScreenWidth(context) / 1.5,
                child: Row(
                  children: [
                    // -- City Name
                    Text(
                      'Amesterdam',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    SizedBox(width: mySizes.spaceBetweenSections * 1.5),

                    // -- Weather Degree
                    Text(
                      '12°C',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),

                    SizedBox(width: mySizes.spaceBetweenItems + 5),

                    // -- Weather Icon
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 5),
                      child: Image.asset(
                        Images.rainyWeather,
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}