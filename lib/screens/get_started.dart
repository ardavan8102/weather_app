import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/screens/welcome.dart';
import 'package:weather_app/utils/colors/colors.dart';
import 'package:weather_app/utils/colors/text_strings.dart';
import 'package:weather_app/utils/device/device_utility.dart';
import 'package:weather_app/utils/helpers/helper_functions.dart';
import 'package:weather_app/widgets/custom_page_route.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final dark = myHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: myDeviceUtilities.getScreenWidth(context),
            height: myDeviceUtilities.getScreenHeight(),
            color:
                dark ? myColors.dark : const Color.fromARGB(255, 227, 229, 241),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/get-started.png'),
                ),
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
                      Texts.getStartedTitle,
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
                      Texts.getStartedSubTitle,
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: dark ? myColors.softGrey : myColors.dark),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, CustomPageRoute(child: WelcomePage()));
                  }, 
                  child: Text(
                    'Get Started',
                    style: Theme.of(context).textTheme.headlineSmall!.apply(color: myColors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
