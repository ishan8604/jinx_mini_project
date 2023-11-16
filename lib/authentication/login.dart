import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/authentication/registration.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool _success;
  late String _userEmail;

  String warning = "";

  void loging(String email, String password) async {
    if (email.isEmpty) {
      setState(() {
        warning = "Please Enter Email";
      });
    } else if (password.isEmpty) {
      setState(() {
        warning = "Please Enter Password";
      });
    }
  }

  void login() async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)) as User;
      if (user != null) {
        _success = true;
        _userEmail = user.email as String;
      } else {
        _success = false;
      }
    } catch (e) {
      print(e);
      emailController.text = "";
      passwordController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
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
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        "Let's Sign you in.",
                        style: GoogleFonts.kanit(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text("Welcome back.",
                          style: GoogleFonts.workSans(
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.tertiary)),
                      Text("You've been missed!",
                          style: GoogleFonts.workSans(
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.tertiary)),
                      SizedBox(
                        height: height * 0.05,
                      ),

                      //Email TextField
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(210, 210, 210, 1.0)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary),
                                border: InputBorder.none,
                                filled: true,
                              ))),
                      SizedBox(
                        height: height * 0.01,
                      ),

                      //Password TextField
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(210, 210, 210, 1.0)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  border: InputBorder.none,
                                  filled: true,
                                  suffixIcon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                  )))),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {}, child: Text("Forget Password?"))
                        ],
                      ),
                      Text(
                        warning,
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: height * 0.25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => registration()));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: height * 0.05,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                loging(emailController.text,
                                    passwordController.text);
                              });
                              login();
                              emailController.clear();
                              passwordController.clear();
                              Timer(Duration(milliseconds: 1500), () {
                                setState(() {
                                  warning = "";
                                });
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).colorScheme.tertiary),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  // Change your radius here
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            child: Text(
                              "Sign In",
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
