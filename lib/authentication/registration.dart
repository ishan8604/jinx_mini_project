import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



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

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 15,),
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
                  SizedBox(height: 15,),
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
                  SizedBox(height: 15,),
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
                  SizedBox(height: 15,),
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
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I agree with Jinx",style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                      TextButton(onPressed: (){}, child: Text("Terms,Privacy Policy",style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  SizedBox(height: 15,),
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
                        child: Text("Sign up",)
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(thickness: 2,),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account?",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                      TextButton(onPressed: (){}, child: Text("Sign In",style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold),)),
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
