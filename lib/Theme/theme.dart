import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Color.fromRGBO(216, 249, 217, 1.0),
    onSurface: Color.fromRGBO(69, 191, 85, 1.0),
    primary: Color.fromRGBO(22, 128, 57, 1.0),
    secondary: Color.fromRGBO(4, 77, 41, 1.0),
      tertiary: Color.fromRGBO(0, 38, 28, 1.0),

    onBackground: Colors.white,
    onPrimary: Colors.black,

    onSecondary: Color.fromRGBO(248, 248, 248, 1.0)
  )
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Color.fromRGBO(0, 38, 28, 1.0),
      onSurface: Color.fromRGBO(4, 77, 41, 1.0),
      primary: Color.fromRGBO(22, 128, 57, 1.0),
      secondary:Color.fromRGBO(69, 191, 85, 1.0),
      tertiary: Color.fromRGBO(216, 249, 217, 1.0),

      onBackground: Colors.black,
      onPrimary: Colors.white,

      onSecondary: Color.fromRGBO(50, 50, 50, 1.0)
    )
);