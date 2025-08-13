import 'package:flutter/material.dart';
import 'package:tu_bolitero/core/themes/themes.dart';

class ThemeFactory {
  static ThemeData getTheme(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    return brightness == Brightness.light ? lightTheme : darkTheme;
  }
}
