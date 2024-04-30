import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/constants/sizes.dart';
import 'package:weather_app/utils/device/device_utility.dart';
import 'package:weather_app/widgets/home/vertical_card.dart';


class degreeOfDaysWidget extends StatelessWidget {
  const degreeOfDaysWidget({
    super.key,
    required this.context,
    required this.dark,
  });

  final BuildContext context;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
            width: myDeviceUtilities.getScreenWidth(context),
            height: myDeviceUtilities.getScreenHeight() * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    roundedVerticalCard(
                      backgroundColor: dark ? myColors.dark : myColors.primaryBackground,
                      showBorder: true,
                      borderColor: dark ? myColors.primaryBackground : myColors.dark,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Wed',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                            Divider(
                              thickness: 3,
                              color: dark ? myColors.white : myColors.dark,
                              indent: 5,
                              endIndent: 5,
                            ),

                            SizedBox(height: 5,),

                            Center(
                              child: Text(
                                '21°',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: mySizes.spaceBetweenItems,
                    ),

                    roundedVerticalCard(
                      backgroundColor: dark ? myColors.dark : myColors.primaryBackground,
                      showBorder: true,
                      borderColor: dark ? myColors.primaryBackground : myColors.dark,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Thu',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                            Divider(
                              thickness: 3,
                              color: dark ? myColors.white : myColors.dark,
                              indent: 5,
                              endIndent: 5,
                            ),

                            SizedBox(height: 5,),

                            Center(
                              child: Text(
                                '25°',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: mySizes.spaceBetweenItems,
                    ),

                    roundedVerticalCard(
                      backgroundColor: dark ? myColors.dark : myColors.primaryBackground,
                      showBorder: true,
                      borderColor: dark ? myColors.primaryBackground : myColors.dark,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Fri',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                            Divider(
                              thickness: 3,
                              color: dark ? myColors.white : myColors.dark,
                              indent: 5,
                              endIndent: 5,
                            ),

                            SizedBox(height: 5,),

                            Center(
                              child: Text(
                                '11°',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: mySizes.spaceBetweenItems,
                    ),

                    roundedVerticalCard(
                      backgroundColor: dark ? myColors.dark : myColors.primaryBackground,
                      showBorder: true,
                      borderColor: dark ? myColors.primaryBackground : myColors.dark,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sat',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                            Divider(
                              thickness: 3,
                              color: dark ? myColors.white : myColors.dark,
                              indent: 5,
                              endIndent: 5,
                            ),

                            SizedBox(height: 5,),

                            Center(
                              child: Text(
                                '-1°',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: mySizes.spaceBetweenItems,
                    ),

                    roundedVerticalCard(
                      backgroundColor: dark ? myColors.dark : myColors.primaryBackground,
                      showBorder: true,
                      borderColor: dark ? myColors.primaryBackground : myColors.dark,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sun',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                            Divider(
                              thickness: 3,
                              color: dark ? myColors.white : myColors.dark,
                              indent: 5,
                              endIndent: 5,
                            ),

                            SizedBox(height: 5,),

                            Center(
                              child: Text(
                                '9°',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: mySizes.spaceBetweenItems,
                    ),

                    roundedVerticalCard(
                      backgroundColor: dark ? myColors.dark : myColors.primaryBackground,
                      showBorder: true,
                      borderColor: dark ? myColors.primaryBackground : myColors.dark,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Mon',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                            Divider(
                              thickness: 3,
                              color: dark ? myColors.white : myColors.dark,
                              indent: 5,
                              endIndent: 5,
                            ),

                            SizedBox(height: 5,),

                            Center(
                              child: Text(
                                '19°',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}