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

  String warning="";

  void register(String name,String username,String email,String password,String confirmPassword)async{
    warning = await auth_methods().registration(name: name, username: username, email: email, password: password, confirmPassword: confirmPassword);
    warning = "*"+warning+"*";
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Set up your Jinx account",style:GoogleFonts.kanit(fontSize: 25,fontWeight: FontWeight.w400,color:Theme.of(context).colorScheme.tertiary,),),
                  Text("Start your journey with us",style:GoogleFonts.kanit(fontSize: 15,color:Theme.of(context).colorScheme.tertiary,),),
                  SizedBox(height: 80,),

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
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              border: InputBorder.none,
                              filled:true,
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
                              hintText: 'userName',
                              hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              border: InputBorder.none,
                              filled:true,
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
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              border: InputBorder.none,
                              filled:true,
                              suffixIcon: Icon(Icons.remove_red_eye,color: Colors.white,)
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
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Confirm Your Password',
                              hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                              border: InputBorder.none,
                              filled:true,
                              suffixIcon: Icon(Icons.remove_red_eye,color: Colors.white,)
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
                  Text(warning,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                  SizedBox(height: height*0.14,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            register(
                                nameController.text,
                                usernameController.text,
                                emailController.text,
                                passwordController.text,
                                confirmpasswordController.text
                            );
                          });
                          nameController.clear();
                          usernameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          confirmpasswordController.clear();
                          Timer(Duration(milliseconds: 1500), () {
                            setState(() {
                              warning="";
                            });
                          });

                        },


                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.tertiary),
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
    );
  }
}
