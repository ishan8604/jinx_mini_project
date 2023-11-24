import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/Dm_window/dm_main_window.dart';

class dm_window extends StatefulWidget {
  const dm_window({super.key});

  @override
  State<dm_window> createState() => _dm_windowState();
}

class _dm_windowState extends State<dm_window> {

  TextEditingController msgSearch = TextEditingController();
  bool isShowUser = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(23, 22, 22, 1.0),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 120,
              backgroundColor: Colors.black,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(onTap:(){Navigator.of(context).pop();},child: Icon(Icons.keyboard_arrow_left,color: Color.fromRGBO(216, 249, 217, 1.0))),
                      SizedBox(width: 15,),
                      Text("Messages",style: GoogleFonts.sriracha(color: Color.fromRGBO(216, 249, 217, 1.0)),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextFormField(
                        style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0)),
                        controller: msgSearch,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search_outlined,color: Colors.white,size:30 ,),
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(icon: Icon(Icons.cancel_outlined,color: Colors.white,size:20 ,),onPressed: (){setState(() {
                            msgSearch.clear();
                          });},),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2,color: Color.fromRGBO(240, 240, 240, 1.0)),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                  ),
                ],
              )
            ),
          body: isShowUser?FutureBuilder(
              future: FirebaseFirestore.instance.collection('UsersDetails')
                  .where("username",isEqualTo: msgSearch.text).get(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(color: Colors.black,),);
                }
                return ListView.builder(
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>dm_main_window(profileImg: (snapshot.data!).docs![index]['profileImg'], username: (snapshot.data!).docs![index]['username'], fullname: (snapshot.data!).docs![index]['fullname'],receiverEmail: (snapshot.data!).docs![index]['email'],receiverUid: (snapshot.data!).docs![index]['uid'],)));
                        },
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
                                  child: (snapshot.data!).docs![index]['profileImg']==""?ClipRRect(child: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),):ClipRRect(child: Image.network((snapshot.data! as dynamic).docs[index]['profileImg'],fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),)
                              ),
                              title: Text((snapshot.data!).docs![index]['username']),
                            ),
                          ),
                        ),
                      );
                    }
                );
              },

            ):
            FutureBuilder(
                future:   FirebaseFirestore.instance.collection('posts').get(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator(color: Colors.black,),);
                  }
                  return Scaffold(
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
                  );
                }
            )

        )
    );
  }
}
