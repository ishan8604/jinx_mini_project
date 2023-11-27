
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/Edit_Profile/edit_profile.dart';
import 'package:jinx/authentication/auth_method.dart';
import 'package:jinx/authentication/login.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';


class userProfile extends StatefulWidget {
  final String uid;
  const userProfile({super.key,required this.uid});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {

  var UserData = {};
  String fullname = "";
  String username = "";
  String bio = "";
  String profileImg = "";
  int postlength = 0;
  int followers = 0;
  int following = 0;

  List<File> _image = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      var Usersnap = await FirebaseFirestore.instance.collection('UsersDetails')
          .doc(widget.uid)
          .get();
      var postSnap = await FirebaseFirestore.instance.collection('posts').where(
          'uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
      UserData = Usersnap.data()!;
      postlength = postSnap.docs.length;
      fullname = UserData['fullname'];
      username = UserData['username'];
      bio = UserData['bio'];
      profileImg = UserData['profileImg'];
      followers = Usersnap.data()!['followers'].length;
      following = Usersnap.data()!['following'].length;
      setState(() {});
    }
    catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(23, 22, 22, 1.0),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: fullname == "" ? CircularProgressIndicator(
            color: Colors.white,) : Text(fullname,
            style: GoogleFonts.ebGaramond(fontWeight: FontWeight.bold,
                color: Color.fromRGBO(216, 249, 217, 1.0)),),
          actions: [
            IconButton(onPressed: () {},
                icon: Icon(Icons.add_circle_outline_outlined,
                  color: Color.fromRGBO(216, 249, 217, 1.0),)),
            IconButton(
                onPressed: () async {
                  final urlImage = profileImg == ""
                      ? "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"
                      : profileImg;
                  final url = Uri.parse(urlImage);
                  final response = await http.get(url);
                  Share.shareXFiles(
                      [
                        XFile.fromData(
                            response.bodyBytes,
                            name: username,
                            mimeType: 'image/png'
                        ),
                      ],
                      text: "@" + username + "Followers:" +
                          followers.toString() + "Following:" +
                          following.toString() + "Posts:" +
                          postlength.toString()
                  );
                },
                icon: Icon(
                  Icons.share, color: Color.fromRGBO(216, 249, 217, 1.0),))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(23, 22, 22, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 320,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50)),
                                      color: Colors.black45
                                  ),
                                  child: profileImg == "" ? ClipRRect(child: Image
                                      .network(
                                    "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",
                                    fit: BoxFit.cover,),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50)),) : ClipRRect(
                                    child: Image.network(
                                      profileImg, fit: BoxFit.cover,),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50)),)
                              ),
                            ],
                          ),
                          Spacer(),
                          username == "" ? CircularProgressIndicator(
                            color: Colors.white,) : Text(
                            "${UserData['username']}", style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Color.fromRGBO(216, 249, 217, 1.0)),),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Column(
                                children: [
                                  Text(postlength.toString(),
                                    style: GoogleFonts.oswald(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),),
                                  Text("Posts",
                                    style: GoogleFonts.cormorantGaramond(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(followers.toString(),
                                    style: GoogleFonts.oswald(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),),
                                  Text("Followers",
                                    style: GoogleFonts.cormorantGaramond(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(following.toString(),
                                    style: GoogleFonts.oswald(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),),
                                  Text("Following",
                                    style: GoogleFonts.cormorantGaramond(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                          Spacer(),
                          Spacer(),
                          bio == null ? CircularProgressIndicator(
                            color: Colors.white,) : Text("${UserData['bio']}",
                              style: GoogleFonts.heebo(color: Color.fromRGBO(216, 249, 217, 1.0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              Container(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => edit_profile()));
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<
                                          Color>(Colors.white),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          // Change your radius here
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                    child: Text("Edit Profile",
                                      style: TextStyle(color: Color.fromRGBO(0, 38, 28, 1.0)),)
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await auth_methods().signOut();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => login()));
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<
                                          Color>(Colors.white),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          // Change your radius here
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Log Out", style: TextStyle(color: Color.fromRGBO(0, 38, 28, 1.0)),)
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Spacer(),
                          Divider(thickness: 2, color: Colors.white,),
                        ],
                      ),
                    ),
                    Container(
                          height: 282,
                          child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(children: [Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.35,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),),],),
                                        Row(children: [Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.35,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),),],),
                                        Row(children: [Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.35,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),),],),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 282,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white12,
                                    child: Center(child: Text("Coming Soon...",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))
                                  )
                                ],
                              )
                      ),
                  ]),
            ),
          ),
        )
    );
  }
}
