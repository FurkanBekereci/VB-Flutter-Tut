import 'package:flutter/material.dart';

class LightTheme {
  late final _LightColors _lightColors;

  LightTheme() {
    _lightColors = _LightColors();
    theme = ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      textTheme:
          ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 25, color: _lightColors.textColor)),
      buttonTheme:
          ButtonThemeData(colorScheme: ColorScheme.light(primary: Colors.purple, secondary: _lightColors.blueMenia)),
      colorScheme: const ColorScheme.light(),
    );
  }

  late final ThemeData theme;
}

class _LightColors {
  final Color textColor = const Color.fromARGB(255, 27, 25, 25);
  final Color blueMenia = const Color.fromARGB(255, 95, 188, 248);
}
