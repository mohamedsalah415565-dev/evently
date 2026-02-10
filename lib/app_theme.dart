import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff0E3A99);
  static const Color primaryDark = Color(0xff457AED);
  static const Color background = Color(0xffF4F7FF);
  static const Color backgroundDark = Color(0xff000F30);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff1C1C1C);
  static const Color gray = Color(0xff686868);
  static const Color grayDark = Color(0xff000F30);

  static ThemeData darkTheme = ThemeData();
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: background,
    primaryColor: primary,

    textTheme:  TextTheme(
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: gray,
      ),
    ),

    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor: white,
      selectedItemColor: primary,
      unselectedItemColor: gray,
    ),

    floatingActionButtonTheme:  FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: white,
      shape: CircleBorder(),
    ),
  );
}
