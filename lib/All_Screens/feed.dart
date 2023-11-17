import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/post_Data/postCard.dart';

class feed extends StatefulWidget {
  const feed({super.key});

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/background1.png",fit: BoxFit.cover,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          title: Text("JINX",style: GoogleFonts.sriracha(),),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline)),
            ],
          ),
        body: Center(
          child: ListView(
            children: [
              postCard(),
              postCard(),
              postCard(),
              postCard(),
              postCard(),
          ],
        )
      ),
    )
      ],
    );
  }
}
