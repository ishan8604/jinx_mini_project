import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/Edit_Profile/edit_profile.dart';


class userProfile extends StatefulWidget {
  final String uid;
  const userProfile({super.key,required this.uid});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {

  var UserData ={};
  String fullname ="";
  String username ="";
  String bio="";
  String profileImg="";
  int postlength=0;
  int followers=0;
  int following=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData() async{
    try{
      var Usersnap = await FirebaseFirestore.instance.collection('UsersDetails').doc(widget.uid).get();
      var postSnap = await FirebaseFirestore.instance.collection('posts').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
      UserData = Usersnap.data()!;
      postlength=postSnap.docs.length;
      fullname = UserData['fullname'];
      username = UserData['username'];
      bio = UserData['bio'];
      profileImg= UserData['profileImg'];
      followers = Usersnap.data()!['followers'].length;
      following = Usersnap.data()!['following'].length;
      setState(() {});
    }
    catch(e){print(e.toString());}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: fullname == ""?CircularProgressIndicator(color: Colors.white,):Text(fullname,style: GoogleFonts.ebGaramond(fontWeight: FontWeight.bold,color: Color.fromRGBO(216, 249, 217, 1.0)),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline_outlined,color: Color.fromRGBO(216, 249, 217, 1.0),)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_sharp,color: Color.fromRGBO(216, 249, 217, 1.0),))
        ],
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
                            child: profileImg==""?ClipRRect(child: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),):ClipRRect(child: Image.network(profileImg,fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),)
                          ),
                        ],
                      ),
                      Spacer(),
                      username==""?CircularProgressIndicator(color: Colors.white,):Text("${UserData['username']}",style: GoogleFonts.tajawal(fontWeight: FontWeight.w900,fontSize: 20,color: Theme.of(context).colorScheme.tertiary),),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              Text(postlength.toString(),style:GoogleFonts.oswald(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.onPrimary),),
                              Text("Posts",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(followers.toString(),style:GoogleFonts.oswald(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 20),),
                              Text("Followers",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(following.toString(),style:GoogleFonts.oswald(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 20),),
                              Text("Following",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                      Spacer(),
                      Spacer(),
                      bio==null?CircularProgressIndicator(color: Colors.white,):Text("${UserData['bio']}",style:GoogleFonts.heebo(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold,fontSize: 15)),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Container(
                            child: ElevatedButton(
                                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>edit_profile()));},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      // Change your radius here
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                                child: Text("Edit Profile",style: TextStyle(color: Theme.of(context).colorScheme.background),)
                            ),
                          ),
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
                                child: Text("Share Profile",style: TextStyle(color: Theme.of(context).colorScheme.background),)
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Spacer(),
                      Divider(thickness: 2,color: Theme.of(context).colorScheme.onPrimary,),
                    ],
                  ),
                ),
              Container(
                height: 282,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:GridView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    children: [
                      GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ), GestureDetector(
                        onTap: (){print("Imag Tapped");},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
