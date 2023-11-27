import 'dart:async';
import 'package:jinx/Home_Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/authentication/login.dart';


class splash_scren extends StatefulWidget {
  const splash_scren({super.key});

  @override
  State<splash_scren> createState() => _splash_screnState();
}

class _splash_screnState extends State<splash_scren> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 1200), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: [
            Image.asset("assets/background1.png",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
            Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  child: Center(
                    child: Text("JINX",style: GoogleFonts.bebasNeue(color:Color.fromRGBO(216, 249, 217, 1.0),fontSize: 40)),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("from",style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0),),),
                      SizedBox(width: 10,),
                      Text("Jinx",style: GoogleFonts.sriracha(color: Color.fromRGBO(216, 249, 217, 1.0),fontSize: 26),)
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}


class splash_scren1 extends StatefulWidget {
  const splash_scren1({super.key});

  @override
  State<splash_scren1> createState() => _splash_scren1State();
}

class _splash_scren1State extends State<splash_scren1> {

  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 1200), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home_screen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: [
            Image.asset("assets/background1.png",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
            Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  child: Center(
                    child: Text("JINX",style: GoogleFonts.bebasNeue(color:Color.fromRGBO(216, 249, 217, 1.0),fontSize: 40)),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("from",style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0)),),
                      SizedBox(width: 10,),
                      Text("Jinx",style: GoogleFonts.sriracha(color: Color.fromRGBO(216, 249, 217, 1.0),fontSize: 26),)
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}

