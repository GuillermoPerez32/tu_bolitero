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
    onSurfaceVariant: Color.fromRGBO(180, 180, 185, 1),
    secondary: Color.fromRGBO(45, 55, 72, 1),
    onSecondary: Color.fromRGBO(147, 197, 253, 1),
    tertiary: Color.fromRGBO(255, 215, 0, 1),
    onTertiary: Colors.black,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  chipTheme: const ChipThemeData(
    disabledColor: Color.fromRGBO(45, 55, 72, 1),
    labelStyle: TextStyle(
        color: Color.fromRGBO(147, 197, 253, 1),
        fontWeight: FontWeight.w400,
        fontSize: 14),
    selectedColor: Color.fromRGBO(45, 55, 72, 1),
    checkmarkColor: Color.fromRGBO(147, 197, 253, 1),
    surfaceTintColor: Color.fromRGBO(45, 55, 72, 1),
    selectedShadowColor: Colors.transparent,
    secondarySelectedColor: Color.fromRGBO(45, 55, 72, 1),
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
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Color.fromRGBO(80, 80, 80, 1),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Color.fromRGBO(80, 80, 80, 1),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Color.fromRGBO(120, 120, 120, 1),
        width: 2,
      ),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color.fromRGBO(255, 98, 95, 1),
    contentTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    actionTextColor: Colors.white,
    behavior: SnackBarBehavior.floating,
  ),
);
