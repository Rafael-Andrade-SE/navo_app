import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1E2A78);
  static const Color secondaryColor = Color(0xFF4B84F1);
  static const Color backgroundColor = Color(0xFFF2F2F2);
  static const Color textColor = Color(0xFF333333);
  static const Color successColor = Color(0xFF43A047);
  static const Color errorColor = Color(0xFFE53935);
  static const Color appBarBackgroundColor = backgroundColor;

  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color darkCardColor = Color(0xFF1E1E1E);
  static const Color darkTextColor = Color(0xFFE0E0E0);

  /// 🌞 Tema Claro
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: textColor),
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.light,
    ),
    fontFamily: 'Roboto',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: secondaryColor, width: 2),
      ),
      labelStyle: const TextStyle(color: textColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: secondaryColor,
      ),
    ),
  );

  /// 🌚 Tema Escuro
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackgroundColor,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkCardColor,
      elevation: 0,
      iconTheme: IconThemeData(color: darkTextColor),
      titleTextStyle: TextStyle(
        color: darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.dark,
    ),
    cardColor: darkCardColor,
    fontFamily: 'Roboto',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkCardColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: secondaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: secondaryColor, width: 2),
      ),
      labelStyle: const TextStyle(color: darkTextColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: secondaryColor,
      ),
    ),
  );
}
