import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/device/device_utility.dart';

class roundedVerticalCard extends StatelessWidget {
  const roundedVerticalCard(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.showBorder = false,
      this.borderColor = myColors.white
    });

  final Widget? child;
  final Color? backgroundColor;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myDeviceUtilities.getScreenWidth(context) / 4,
      height: myDeviceUtilities.getScreenHeight() * 0.2,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: showBorder ? Border.all(color: borderColor, width: 4) : null,
      ),
      child: child,
    );
  }
}