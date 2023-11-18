import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/All_Screens/feed.dart';
import 'package:jinx/Home_Screen/home_screen.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Notification",style: GoogleFonts.signikaNegative(
            color: Color.fromRGBO(216, 249, 217, 1.0),
            fontWeight: FontWeight.bold,
            fontSize: 20),),
      ),
    );
  }
}
