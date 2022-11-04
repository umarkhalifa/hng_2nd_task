import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xff1978E0),
      fontFamily: "Poppins",
      shadowColor: Colors.black.withOpacity(0.1),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary:  Color(0xff1978E0),
          onPrimary: Colors.white,
          secondary:  Color(0xff82AED1),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black));
  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xff1978E0),
      fontFamily: "Poppins",
      shadowColor: Colors.white.withOpacity(0.06),
      scaffoldBackgroundColor: const Color(0xff1d1d1d),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary:  Color(0xff1978E0),
          onPrimary: Colors.white,
          secondary:  Color(0xff82AED1),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xff1d1d1d),
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black));
}
