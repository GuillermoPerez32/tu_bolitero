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
      chipTheme: const ChipThemeData(
        disabledColor: Color.fromRGBO(215, 225, 255, 1),
        labelStyle: TextStyle(
            color: Color.fromRGBO(97, 139, 250, 1),
            fontWeight: FontWeight.w400,
            fontSize: 14),
        selectedColor: Color.fromRGBO(215, 225, 255, 1),
        checkmarkColor: Color.fromRGBO(97, 139, 250, 1),
        surfaceTintColor: Color.fromRGBO(215, 225, 255, 1),
        selectedShadowColor: Color.fromRGBO(97, 139, 250, 1),
        secondarySelectedColor: Color.fromRGBO(215, 225, 255, 1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          side: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
      ),
    );
  }
}
