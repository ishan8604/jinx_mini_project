import 'package:flutter/material.dart';
import 'package:jinx/Splash_Screen/splash_Screen.dart';
import 'package:jinx/Theme/theme.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash_scren(),
    theme: lightTheme,
    darkTheme: darkTheme,
  ));
}