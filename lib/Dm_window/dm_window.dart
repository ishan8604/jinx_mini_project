import 'package:flutter/material.dart';
import 'package:jinx/Dm_window/dm_card.dart';

class dm_window extends StatefulWidget {
  const dm_window({super.key});

  @override
  State<dm_window> createState() => _dm_windowState();
}

class _dm_windowState extends State<dm_window> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            dm_card(),
            dm_card(),
            dm_card(),
          ],
        )
    );
  }
}
