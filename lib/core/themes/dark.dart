import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Color.fromRGBO(20, 20, 20, 1),
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
  scaffoldBackgroundColor: const Color.fromRGBO(20, 20, 20, 1),
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme.dark(
    primary: Color.fromRGBO(255, 98, 95, 1),
    surface: Color.fromRGBO(20, 20, 20, 1),
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
  cardTheme: const CardThemeData(
    elevation: 0,
    color: Color.fromRGBO(56, 55, 55, 1),
  ),
);
