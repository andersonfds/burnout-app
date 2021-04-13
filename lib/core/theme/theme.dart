import 'package:flutter/material.dart';
import 'package:get/get.dart';

lightTheme() {
  // Color definitions
  final lightGradientBlue = Color(0xFFFFEA32);
  final darkGradientBlue = Color(0xFFFFEA32);
  final lightBackground = Color(0xFFEFEFEF);

  // Palette definitions
  final primaryColor = darkGradientBlue;
  final accentColor = lightGradientBlue;
  final minimumButtonSize = Size(120, 50);
  final borderWidth = 2.0;
  final canvasColor = Color(0xFF151515);

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorBrightness: Brightness.light,
    accentColor: accentColor,
    accentColorBrightness: Brightness.light,
    brightness: Brightness.dark,
    canvasColor: canvasColor,
    backgroundColor: lightBackground,
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: Get.textTheme,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryColor,
        minimumSize: minimumButtonSize,
        shape: StadiumBorder(),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: Colors.black,
        minimumSize: minimumButtonSize,
        shape: StadiumBorder(),
      ),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: primaryColor,
        minimumSize: minimumButtonSize,
        shape: StadiumBorder(),
        side: BorderSide(
          color: primaryColor,
          width: borderWidth,
        ),
      ),
    ),
  );
}
