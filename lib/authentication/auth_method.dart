import 'package:jinx/authentication/registration.dart';

class auth_methods{
  String loginingWarning = "";
  String registerWarning = "";

  String loging({required String email,required String password}) {
    if(email.isEmpty){
        loginingWarning="Please Enter Email";
    }
    else if(password.isEmpty){
        loginingWarning="Please Enter Password";
    }
    else{
      loginingWarning = "Please Enter All Details";
    }
    return loginingWarning;
  }
  String registration({
    required String name,
    required String username,
    required String email,
    required String password,
    required String confirmPassword
  }){
    if(email.isEmpty){
      registerWarning="Please Enter Email";
    }
    else if(password.isEmpty){
      registerWarning="Please Enter Password";
    }
    else if(name.isEmpty){
      registerWarning="Please Enter Name";
    }
    else if(username.isEmpty){
      registerWarning="Please Enter UserName";
    }
    else{
      registerWarning = "Please Enter All Details";
    }
    return registerWarning;
  }
}