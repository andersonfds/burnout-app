import 'package:flutter/material.dart';

lightTheme() {
  // Color definitions
  final lightGradientBlue = Color(0xFF05C5C6);
  final darkGradientBlue = Color(0xFF0092C6);
  final lightBackground = Color(0xFFEFEFEF);

  // Palette definitions
  final primaryColor = darkGradientBlue;
  final accentColor = lightGradientBlue;
  final minimumButtonSize = Size(120, 58);
  final buttonRadius = BorderRadius.circular(12.0);
  final borderWidth = 2.0;

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorBrightness: Brightness.light,
    accentColor: accentColor,
    accentColorBrightness: Brightness.light,
    brightness: Brightness.light,
    backgroundColor: lightBackground,
    fontFamily: 'Poppins',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryColor,
        minimumSize: minimumButtonSize,
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        minimumSize: minimumButtonSize,
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: primaryColor,
        minimumSize: minimumButtonSize,
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
        side: BorderSide(
          color: primaryColor,
          width: borderWidth,
        ),
      ),
    ),
  );
}
