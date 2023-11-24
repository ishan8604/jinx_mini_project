import 'package:flutter/material.dart';

class dm_main_window extends StatefulWidget {
  const dm_main_window({super.key});

  @override
  State<dm_main_window> createState() => _dm_main_windowState();
}

class _dm_main_windowState extends State<dm_main_window> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Text("Useranme"));
  }
}
