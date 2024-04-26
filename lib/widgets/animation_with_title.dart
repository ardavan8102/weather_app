import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/device/device_utility.dart';

class imageWithTitleAndSubTitle extends StatelessWidget {
  const imageWithTitleAndSubTitle({
    super.key,
    required this.dark,
    required this.image,
    required this.title,
    required this.subTitle,
    this.showButton = false,
    this.buttonText,
    this.buttonPadding, 
    this.onPressed,
  });

  final bool dark;
  final String image, title, subTitle;
  final String? buttonText;
  final bool showButton;
  final double? buttonPadding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: myDeviceUtilities.getScreenWidth(context),
        height: myDeviceUtilities.getScreenHeight(),
        color: dark ? myColors.dark : const Color.fromARGB(255, 227, 229, 241),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(image),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: myDeviceUtilities.getScreenWidth(context) * 0.7,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: myDeviceUtilities.getScreenWidth(context) * 0.7,
              height: myDeviceUtilities.getScreenHeight() * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: dark ? myColors.softGrey : myColors.dark),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            if (showButton) ElevatedButton(
              onPressed: onPressed,
              child: Text(
                buttonText!,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: myColors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(buttonPadding!),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}