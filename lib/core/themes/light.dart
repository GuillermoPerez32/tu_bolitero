import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(255, 98, 95, 1),
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
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
    onSurfaceVariant: Color.fromRGBO(107, 107, 113, 1),
    secondary: Color.fromRGBO(215, 225, 255, 1),
    onSecondary: Color.fromRGBO(61, 139, 250, 1),
    tertiary: Color.fromRGBO(255, 215, 0, 1),
    onTertiary: Colors.black,
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
        color: Color.fromRGBO(200, 200, 200, 1),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Color.fromRGBO(200, 200, 200, 1),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Color.fromRGBO(200, 200, 200, 1),
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
