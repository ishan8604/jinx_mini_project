import 'package:jinx/authentication/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jinx/models/userModel.dart' as model;

class auth_methods{

  String loginingWarning = "";
  String registerWarning = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> loging({required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        loginingWarning = "Success";
      }
      else if(email.isEmpty){loginingWarning="Please Enter Email";}
      else if(password.isEmpty){loginingWarning="Please Enter Password";}
    } on FirebaseAuthException catch (err) {
      if (err.code == "user-not-found") {
        loginingWarning="Try Again! User not found";
      } else if (err.code == "wrong-password") {
        loginingWarning="Try Again! Wrong Password";
      }
    }
    return loginingWarning;
  }
  Future<String> registration({
    required String email,
    required String FullName,
    required String UserName,
    required String Password,
    required String confirmPassword
  }) async {
    try {
      if (email.isNotEmpty && UserName.isNotEmpty && Password.isNotEmpty && Password==confirmPassword) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: Password);

        model.UserModel user  = model.UserModel(
            username: UserName,
            uid: cred.user!.uid,
            email: email,
            FullName: FullName,
            Password: Password,
            follower: [],
            following: []
        );
        //add user to our database
        _firestore.collection('UsersDetails').doc(cred.user!.uid).set(user.toJson());
        registerWarning ='Success';
      }
      else if (email.isEmpty) {
        registerWarning ='Please Enter Email';
      }
      else if (FullName.isEmpty) {
        registerWarning ='Please Enter FullName';
      }
      else if (UserName.isEmpty) {
        registerWarning ='Please Enter UserName';
      }
      else if (Password.isEmpty) {
        registerWarning ='Please Enter Password';
      }
      else if(Password!=confirmPassword){
        registerWarning ='Password Mismatch';
      }
    } on FirebaseAuthException catch (err) {
      if(err.code == "email-already-in-use"){
        registerWarning="Email Already Exits";
      }
    }
    return registerWarning;
  }
}