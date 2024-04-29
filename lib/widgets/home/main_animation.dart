import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/utils/constants/image_strings.dart';
import 'package:weather_app/utils/constants/sizes.dart';
import 'package:weather_app/utils/device/device_utility.dart';

class homeTopAnimation extends StatelessWidget {
  const homeTopAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: mySizes.spaceBetweenSections),
      child: Stack(
        children: [
          // -- Sun
          Positioned(
            top: 10,
            right: 70,
            child: Lottie.asset(
              Images.cyclingSun,
              width: myDeviceUtilities.getScreenWidth(context) / 4,
            ),
          ),
          // -- Cloud & Thunder
          Center(
            child: Lottie.asset(
              Images.thunderAndCloud,
              width: myDeviceUtilities.getScreenWidth(context) / 1.5,
            ),
          ),
          // -- Snowflake
          Positioned(
            top: 30,
            left: 70,
            child: Lottie.asset(
              Images.glowingSnowflake,
              width: myDeviceUtilities.getScreenWidth(context) / 5,
            ),
          ),
        ],
      ),
    );
  }
}