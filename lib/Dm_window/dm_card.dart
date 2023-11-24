import 'package:flutter/material.dart';
import 'package:jinx/Dm_window/dm_main_window.dart';

class dm_card extends StatefulWidget {
  const dm_card({super.key});

  @override
  State<dm_card> createState() => _dm_cardState();
}

class _dm_cardState extends State<dm_card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>dm_main_window()));},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.green,
          child: Row(
            children: [
              CircleAvatar(radius: 15,),
              SizedBox(width: 10,),
              Text("Username"),
            ],
          ),
        ),
      ),
    );
  }
}
