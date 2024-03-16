import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'colors.dart';

final theme_cubit = ChangeNotifierProvider<ThemeCubit>((ref) => ThemeCubit());

class ThemeCubit extends ChangeNotifier {
  ThemeCubit();
  bool check = true;

  ThemeData lightTheme = ThemeData(
    shadowColor: Color_.darkPrimary,
    primaryColor: Color_.lightPrimary,
    focusColor: Color_.darkPrimary,
    scaffoldBackgroundColor: Color_.lightBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color_.lightAccent,
      selectionColor: Color_.lightAccent,
      selectionHandleColor: Color_.lightAccent,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Color_.darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xfffcfcff),
      elevation: 0,
    ),
  );

  ThemeData darkTheme = ThemeData(
    shadowColor: Color_.lightPrimary,
    brightness: Brightness.dark,
    primaryColor: Color_.darkBG,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      brightness: Brightness.dark,
      secondary: Color_.darkAccent, // Your accent color
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Color_.lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color_.darkAccent,
      selectionColor: Color_.darkAccent,
      selectionHandleColor: Color_.darkAccent,
    ),
    scaffoldBackgroundColor: Color_.darkBG,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
    ),
  );

  void switch_theme({required bool themestate}) {
    check = themestate;
    notifyListeners();
  }
}
