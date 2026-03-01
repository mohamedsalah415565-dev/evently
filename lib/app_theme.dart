import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff0E3A99);
  static const Color primaryDark = Color(0xff457AED);
  static const Color background = Color(0xffF4F7FF);
  static const Color backgroundDark = Color(0xff000F30);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff1C1C1C);
  static const Color gray = Color(0xff686868);
  static const Color lightgray = Color(0xffB9B9B9);
  static const Color grayDark = Color(0xff000F30);
  static const Color offWhite = Color(0xfff0f0f0);
  static const Color red = Color(0xffff3232);

  static ThemeData darkTheme = ThemeData();
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: background,
    primaryColor: primary,

    textTheme: TextTheme(
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
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white,
      selectedItemColor: primary,
      unselectedItemColor: gray,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: white,
      shape: CircleBorder(),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: white,
      hintStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: gray,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: offWhite),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: offWhite),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: red),
      ),
    ),

    switchTheme: SwitchThemeData(
      trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
      thumbColor: WidgetStatePropertyAll(white),
    ),

    listTileTheme: ListTileThemeData(
      tileColor: white,
      minTileHeight: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: black,
      ),
    ),
  );
}
