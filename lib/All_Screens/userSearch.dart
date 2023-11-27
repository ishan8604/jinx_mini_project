import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jinx/All_Screens/anotherUserProfile.dart';
import 'package:jinx/Home_Screen/home_screen.dart';


class userSearch extends StatefulWidget {
  const userSearch({super.key});

  @override
  State<userSearch> createState() => _userSearchState();
}

class _userSearchState extends State<userSearch> {

  TextEditingController searchUser = TextEditingController();
  bool isShowUser = false;
  List follower=[];
  List following=[];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchUser.dispose();
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: TextFormField(
            style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0)),
                  controller: searchUser,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined,color: Colors.white,size:30 ,),
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(icon: Icon(Icons.cancel_outlined,color: Colors.white,size:20 ,),onPressed: (){setState(() {
                        searchUser.clear();
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>home_screen()));
                      });},),
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
            ),
            onFieldSubmitted: (String _){
              setState(() {
                isShowUser = true;
              });
            },
            ),
          decoration: BoxDecoration(
              border: Border.all(width: 2,color: Color.fromRGBO(240, 240, 240, 1.0)),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
        ),
      ),
      body: isShowUser?FutureBuilder(
        future: FirebaseFirestore.instance.collection('UsersDetails').where('username',isLessThanOrEqualTo: searchUser.text).get(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(color: Colors.black,),);
          }
          return ListView.builder(
              itemCount: (snapshot.data!).docs.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>anotherUserProfile(
                      username: (snapshot.data!).docs![index]['username'],
                      fullname: (snapshot.data!).docs![index]['fullname'],
                      following: (snapshot.data!).docs![index]['following'],
                      follower: (snapshot.data!).docs![index]['followers'],
                      bio: (snapshot.data!).docs![index]['bio'],
                    profileImg: (snapshot.data!).docs![index]['profileImg'],
                    uid: (snapshot.data!).docs![index]['uid'],
                  )));},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                        ),
                      child: ListTile(
                        leading:Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                color: Colors.black
                            ),
                            child: (snapshot.data!).docs![index]['profileImg']==""?ClipRRect(child: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),):ClipRRect(child: Image.network((snapshot.data!).docs![index]['profileImg'],fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),)
                        ),
                        title: Text((snapshot.data!).docs![index]['username']),
                        subtitle: Text((snapshot.data!).docs![index]['fullname']),
                      ),
                    ),
                  ),
                );
              }
          );
        },

      ):
      Scaffold(
              backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      color: Colors.black12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(200)),
                          color: Colors.black26,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(200)),
                              color: Colors.black38,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(100)),
                                  color: Colors.black45,
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Colors.black54,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                          color: Colors.black87,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                                child: Icon(
                                                    Icons.search,
                                                    color: Colors.black,
                                                    size: 35,
                                                  ),),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
    );
  }
}
