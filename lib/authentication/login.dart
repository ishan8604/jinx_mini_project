import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/authentication/registration.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: 50,),
                    Text("Let's Sign you in.",style: GoogleFonts.kanit(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.tertiary),),
                    SizedBox(height: 10,),
                    Text("Welcome back.",style: GoogleFonts.workSans(fontSize: 25,color: Theme.of(context).colorScheme.tertiary)),
                    Text("You've been missed!",style: GoogleFonts.workSans(fontSize: 25,color: Theme.of(context).colorScheme.tertiary)),
                    SizedBox(height: 50,),
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
                    SizedBox(height: 10,),
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
                    SizedBox(height: 250,),
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
                      height: 50,
                      child: ElevatedButton(
                          onPressed: (){},

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.tertiary),
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
    );
  }
}
