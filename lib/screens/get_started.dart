import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:weather_app/screens/welcome.dart';
import 'package:weather_app/utils/constants/image_strings.dart';
import 'package:weather_app/utils/constants/text_strings.dart';
import 'package:weather_app/utils/helpers/helper_functions.dart';
import 'package:weather_app/widgets/animation_with_title.dart';
import 'package:weather_app/widgets/custom_page_route.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final dark = myHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            imageWithTitleAndSubTitle(
              dark: dark,
              image: Images.getStartedAnimation1,
              title: Texts.getStartedTitle1,
              subTitle: Texts.getStartedSubTitle1,
              showButton: true,
              buttonText: 'Ardavan Eskandari',
              buttonPadding: 12,
              onPressed: () async {
                final String url = 'https://github.com/ardavan8102';
                await launchUrlString(
                  url,
                  mode: LaunchMode.inAppBrowserView,
                );
              },
            ),

            imageWithTitleAndSubTitle(
              dark: dark,
              image: Images.getStartedAnimation2,
              title: Texts.getStartedTitle2,
              subTitle: Texts.getStartedSubTitle2,
            ),

            imageWithTitleAndSubTitle(
              dark: dark,
              image: Images.getStartedAnimation3,
              title: Texts.getStartedTitle3,
              subTitle: Texts.getStartedSubTitle3,
              showButton: true,
              buttonText: 'Get Started',
              buttonPadding: 16,
              onPressed: () {
                Navigator.push(context, CustomPageRoute(child: WelcomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
