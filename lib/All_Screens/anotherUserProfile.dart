import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/All_Screens/userProfile.dart';

class anotherUserProfile extends StatefulWidget {
  final String username;
  final String fullname;
  final List following;
  final List follower;
  final String bio;
  final String profileImg;
  final String uid;
  const anotherUserProfile({super.key,required this.username,required this.fullname,required this.following,required this.follower,required this.bio,required this.profileImg,required this.uid});

  @override
  State<anotherUserProfile> createState() => _anotherUserProfileState();
}

class _anotherUserProfileState extends State<anotherUserProfile> {
  
  FirebaseAuth _auth = FirebaseAuth.instance;
  int postlen=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postlenmen();
  }
  void postlenmen()async{
    var postSnap = await FirebaseFirestore.instance.collection('posts').where(
        'uid', isEqualTo: widget.uid).get();
    setState(() {
      postlen = postSnap.docs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.uid==_auth.currentUser?.uid?userProfile(uid: _auth.currentUser!.uid):Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text(widget.fullname,style: GoogleFonts.ebGaramond(fontWeight: FontWeight.bold,color: Color.fromRGBO(216, 249, 217, 1.0)),),
      ),
      body: Container(
        color: Color.fromRGBO(23, 22, 22, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
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
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: Colors.black45
                            ),
                            child: widget.profileImg==""?ClipRRect(child: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),):ClipRRect(child: Image.network(widget.profileImg,fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),)
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(widget.username,style: GoogleFonts.tajawal(fontWeight: FontWeight.w900,fontSize: 20,color: Theme.of(context).colorScheme.tertiary),),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Text(postlen.toString(),style:GoogleFonts.oswald(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.onPrimary),),
                            Text("Posts",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(widget.follower.length.toString(),style:GoogleFonts.oswald(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Followers",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(widget.following.length.toString(),style:GoogleFonts.oswald(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Following",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Text(widget.bio,style:GoogleFonts.heebo(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold,fontSize: 15)),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Container(
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    // Change your radius here
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              child: Text("Follow",style: TextStyle(color: Theme.of(context).colorScheme.background),)
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    Spacer(),
                    Divider(thickness: 2,color: Theme.of(context).colorScheme.onPrimary,),
                  ],
                ),
              ),
              Container(
                  height: 350,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Row(children: [Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.35,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),),],),
                              Row(children: [Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.35,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),),],),
                              Row(children: [Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.35,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),),],),
                              Row(children: [Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.35,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),), Padding(padding: const EdgeInsets.all(3.0), child: Container(width: MediaQuery.of(context).size.width/3.3,height: 100,color: Colors.black,),),],),
                            ],
                          ),
                          Container(
                              height: 420,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white12,
                              child: Center(child: Text("Coming Soon...",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))
                          )
                        ],
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
