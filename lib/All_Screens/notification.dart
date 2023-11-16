import 'package:flutter/material.dart';
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
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text("Notification"),
      ),
    );
  }
}
