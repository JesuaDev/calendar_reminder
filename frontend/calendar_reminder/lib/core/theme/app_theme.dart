import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0F2854);
  static const Color secondaryColor = Color(0xFF1C4D8D);
  static const Color thridColor = Color(0xFF4988C4);
  static const Color fourthColor = Color(0xFFBDE8F5);

  static const Color onColorWhite = Color(0x00FFFFFF);
  static const Color onColorBlack = Color(0xFF092328);
  static const Color colorError = Color(0xFFD62828);
  static const Color colorOnError = Color(0xFF8E1616);
  static const Color colorBrigSurface = Color(0xFF091413);
  static const Color colorBrigOnSurface = Color(0xFF0E1B1A);

  static const Color colorLigSurface = Color(0xFFFEFAF3);
  static const Color colorLigOnSurface = Color(0XFFFBEFEF);

  static const String principalFont = 'mikorn';
  static const String secondaryFont = 'manrope';
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
    titleLarge: TextStyle(fontSize: 25),
    bodyLarge: TextStyle(fontSize: 18, fontFamily: secondaryFont),
    bodyMedium: TextStyle(fontSize: 14, fontFamily: secondaryFont),
  );

  static final InputDecorationTheme inputDecoration = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: InputBorder.none,
    filled: true,
  );

  static ThemeData themeDark = ThemeData(
    fontFamily: principalFont,
    
    textTheme: textTheme,
    inputDecorationTheme: inputDecoration,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: colorLigSurface,
      secondary: secondaryColor,
      onSecondary: onColorBlack,
      error: colorError,
      onError: colorOnError,
      surface: colorBrigSurface,
      onSurface: colorLigSurface,

      tertiary: Color.fromARGB(255, 162, 175, 221),
    ),
  );

  static ThemeData themeLight = ThemeData(
    fontFamily: principalFont,
    textTheme: textTheme,
    inputDecorationTheme: inputDecoration,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: onColorBlack,
      secondary: secondaryColor,
      onSecondary: onColorBlack,
      error: colorError,
      onError: colorOnError,
      surface: colorLigSurface,
      onSurface: colorBrigSurface,
      tertiary: Color(0xFFF6E2E9),
    ),
  );
}
