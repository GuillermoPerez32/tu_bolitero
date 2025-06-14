import 'package:flutter/material.dart';

class ThemeFactory {
  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(255, 98, 95, 1),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: false,
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(243, 242, 242, 1),
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme.light(
        primary: Color.fromRGBO(255, 98, 95, 1),
        surface: Colors.white,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
