import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/authentication/login.dart';

import 'auth_method.dart';



class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  String errorMSG="";
  bool obscureText = true;
  bool obscureText1 = true;

  void register() async {
    errorMSG = await auth_methods().registration(email: emailController.text, FullName: nameController.text, UserName: usernameController.text, Password: passwordController.text, confirmPassword: confirmpasswordController.text);
    if(errorMSG == "Success"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.handshake_rounded),
                SizedBox(width: 15,),
                Text("Successfully Ragistered",style: GoogleFonts.signikaNegative(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8),)
              ],),
          )
      ),behavior: SnackBarBehavior.floating,backgroundColor: Colors.transparent,elevation: 0,));}
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
                  Text(errorMSG,style: GoogleFonts.signikaNegative(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8),textAlign: TextAlign.center,)
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text("Set up your Jinx account",style:GoogleFonts.kanit(fontSize: 24,fontWeight: FontWeight.w400,color:Theme.of(context).colorScheme.tertiary,),),
                      Text("Start your journey with us",style:GoogleFonts.kanit(fontSize: 15,color:Theme.of(context).colorScheme.tertiary,),),
                      SizedBox(height: height*0.08,),

                      //TextField for User Name
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2,color: Color.fromRGBO(210, 210, 210, 1.0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: TextField(
                              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'Full Name',
                                hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                                border: InputBorder.none,
                                filled:true,
                                  fillColor: Colors.transparent
                              )
                          )
                      ),
                      SizedBox(height: height*0.01,),

                      //TextField for UserName
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2,color: Color.fromRGBO(210, 210, 210, 1.0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: TextField(
                              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              controller: usernameController,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                                border: InputBorder.none,
                                filled:true,
                                  fillColor: Colors.transparent
                              )
                          )
                      ),
                      SizedBox(height: height*0.01,),

                      //TextField for Email
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2,color: Color.fromRGBO(210, 210, 210, 1.0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: TextField(
                              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                                border: InputBorder.none,
                                filled:true,
                                  fillColor: Colors.transparent
                              )
                          )
                      ),
                      SizedBox(height: height*0.01,),

                      //TextField for Password
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2,color: Color.fromRGBO(210, 210, 210, 1.0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: TextField(
                              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              controller: passwordController,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
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
                      SizedBox(height: height*0.01,),

                      //TextField for confirmPassword
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2,color: Color.fromRGBO(210, 210, 210, 1.0)),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: TextField(
                              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              controller: confirmpasswordController,
                              obscureText: obscureText1,
                              decoration: InputDecoration(
                                  hintText: 'Confirm Your Password',
                                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                                  border: InputBorder.none,
                                  filled:true,
                                  fillColor: Colors.transparent,
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        obscureText1 = !obscureText1;
                                      });
                                    },
                                    child: obscureText1?Icon(Icons.remove_red_eye,color: Color.fromRGBO(216, 249, 217, 1.0),):Icon(Icons.remove_red_eye,color: Color.fromRGBO(69, 191, 85, 1.0),),
                                  )
                              )
                          )
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I agree with Jinx",style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                          TextButton(onPressed: (){}, child: Text("Terms & Privacy Policy",style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      Text(errorMSG,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      SizedBox(height: height*0.14,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                register();
                              });
                              nameController.clear();
                              usernameController.clear();
                              emailController.clear();
                              passwordController.clear();
                              confirmpasswordController.clear();
                              Timer(Duration(milliseconds: 1500), () {
                                setState(() {
                                  errorMSG="";
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
                            child: Text("Sign up",)
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account?",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                          }, child: Text("Sign In",style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
