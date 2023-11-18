import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/authentication/auth_method.dart';
import 'package:jinx/authentication/registration.dart';

import '../Home_Screen/home_screen.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorMSG1='';
  bool obscureText = true;

  void loginingIn() async {
    errorMSG1 = await auth_methods().loging(email: emailController.text, password: passwordController.text);

    if(errorMSG1 == "Success"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home_screen()));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            width: MediaQuery.of(context).size.width,
            content:
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 3,),
                    Icon(Icons.handshake_outlined),
                    SizedBox(width: 5,),
                    Text("Logged In Successfully",style: GoogleFonts.signikaNegative(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8),textAlign: TextAlign.center,)
                  ],),
              ),
            ),behavior: SnackBarBehavior.floating,backgroundColor: Colors.transparent,elevation: 0,));
    }
    else{ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: MediaQuery.of(context).size.width,
          content:
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 3,),
                  Icon(Icons.warning_rounded),
                  SizedBox(width: 5,),
                  Text(errorMSG1,style: GoogleFonts.signikaNegative(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8),textAlign: TextAlign.center,)
                ],),
            ),
          ),behavior: SnackBarBehavior.floating,backgroundColor: Colors.transparent,elevation: 0,));}

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Stack(
        children: [
          Image.asset("assets/background1.png",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height*0.05,),
                          Text("Let's Sign you in.",style: GoogleFonts.kanit(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromRGBO(216, 249, 217, 1.0)),),
                          SizedBox(height: height*0.02,),
                          Text("Welcome back.",style: GoogleFonts.workSans(fontSize: 25,color: Color.fromRGBO(216, 249, 217, 1.0))),
                          Text("You've been missed!",style: GoogleFonts.workSans(fontSize: 25,color: Color.fromRGBO(216, 249, 217, 1.0))),
                          SizedBox(height: height*0.05,),

                          //Email TextField
                          Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Color.fromRGBO(210, 210, 210, 1.0)),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextField(
                                  style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0)),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0)),
                                      border: InputBorder.none,
                                      filled:true,
                                      fillColor: Colors.transparent
                                  )
                              )
                          ),
                          SizedBox(height: height*0.01,),
                          //Password TextField
                          Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Color.fromRGBO(210, 210, 210, 1.0)),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextField(
                                  style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0)),
                                  controller: passwordController,
                                  obscureText: obscureText,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0)),
                                      border: InputBorder.none,
                                      filled:true,
                                      fillColor: Colors.transparent,
                                      suffixIcon: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            obscureText = !obscureText;
                                          });
                                        },
                                        child: obscureText?Icon(Icons.remove_red_eye,color: Color.fromRGBO(216, 249, 217, 1.0),):Icon(Icons.remove_red_eye,color: Color.fromRGBO(69, 191, 85, 1.0),),
                                      )
                                  )
                              )
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: (){},
                                  child: Text("Forget Password?")
                              )
                            ],
                          ),
                          Text(errorMSG1,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),


                          SizedBox(height: height*0.25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account",style: TextStyle(color: Theme.of(context).colorScheme.tertiary,)),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>registration()));
                              }, child: Text("Register",style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold),)),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: height*0.05,
                            child: ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    loginingIn();
                                  });
                                  emailController.clear();
                                  passwordController.clear();
                                  Timer(Duration(milliseconds: 1500), () {
                                    setState(() {
                                      errorMSG1="";
                                    });
                                  });
                                },

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(4, 77, 41, 1.0)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      // Change your radius here
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                                child: Text("Sign In",)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ),
        ],
      )
    );
  }
}
