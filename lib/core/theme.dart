import 'package:flutter/material.dart';

class ThemeFactory {
  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(46, 28, 255, 1),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontFamily: 'Merienda',
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      fontFamily: 'Merienda',
      colorScheme: const ColorScheme.light(
        primary: Color.fromRGBO(46, 28, 255, 1),
        background: Color.fromRGBO(217, 217, 217, 1),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
