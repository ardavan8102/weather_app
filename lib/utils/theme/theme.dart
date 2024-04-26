import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:weather_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:weather_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:weather_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:weather_app/utils/theme/custom_themes/elevatedButton_theme.dart';
import 'package:weather_app/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:weather_app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:weather_app/utils/theme/custom_themes/text_theme.dart';


class myAppTheme {
  myAppTheme._(); // Avoid Creating Instants

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'reem',
    brightness: Brightness.light,
    primaryColor: myColors.primary,
    scaffoldBackgroundColor: myColors.white,
    textTheme: myTextTheme.lightTextTheme,
    elevatedButtonTheme: myElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: myOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: myTextFieldTheme.lightInputDecorationTheme,
    chipTheme: myChipTheme.lightChipTheme,
    appBarTheme: myAppBarTheme.lightAppBarTheme,
    checkboxTheme: myCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: myBottomSheetTheme.lightBottomSheetTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'reem',
    brightness: Brightness.dark,
    primaryColor: myColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: myTextTheme.darkTextTheme,
    elevatedButtonTheme: myElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: myOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: myTextFieldTheme.darkInputDecorationTheme,
    chipTheme: myChipTheme.darkChipTheme,
    appBarTheme: myAppBarTheme.darkAppBarTheme,
    checkboxTheme: myCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: myBottomSheetTheme.darkBottomSheetTheme,
  );
}