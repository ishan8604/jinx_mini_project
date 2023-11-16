import 'package:flutter/material.dart';
import 'package:jinx/Splash_Screen/splash_Screen.dart';
import 'package:jinx/Theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash_scren(),
    theme: lightTheme,
    darkTheme: darkTheme,
  ));
}