import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color.fromRGBO(235, 243, 232, 1.0),
    primary: Color.fromRGBO(210, 227, 200, 1.0),
    secondary: Color.fromRGBO(143, 203, 165, 1.0),
      tertiary: Color.fromRGBO(134, 167, 137, 1.0)
  )
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background:Color.fromRGBO(4, 13, 18, 1.0),
        primary: Color.fromRGBO(92, 131, 116, 1.0),
        secondary: Color.fromRGBO(13, 161, 161, 1.0),
      tertiary: Color.fromRGBO(147, 177, 166, 1.0)
    )
);