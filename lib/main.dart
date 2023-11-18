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
    theme: lightTheme,
    darkTheme: darkTheme,
    home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          if(snapshot.hasData)  return splash_scren1();
          else if(snapshot.hasError)  return Center(child: Text("Some Error Occured"),);
        }
        if(snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(color: Colors.white,),);
        return splash_scren();
      },
    ),
  ));
}