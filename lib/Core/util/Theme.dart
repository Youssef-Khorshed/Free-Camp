import 'package:flutter/material.dart';

class Constants {
  static String appName = "Flutter Travel";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blueGrey;
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    focusColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
      selectionColor: lightAccent,
      selectionHandleColor: lightAccent,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xfffcfcff),
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      brightness: Brightness.dark,
      secondary: darkAccent, // Your accent color
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
      selectionColor: darkAccent,
      selectionHandleColor: darkAccent,
    ),
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
    ),
  );
}
