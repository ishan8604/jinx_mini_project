import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firestore_methods.dart';
import 'Comment_card.dart';

class comment_screen extends StatefulWidget {
  final snap;
  const comment_screen({super.key, required this.snap});

  @override
  State<comment_screen> createState() => _comment_screenState();
}

class _comment_screenState extends State<comment_screen> {
  final controller = TextEditingController();
  String username = "";
  int commentLength=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
    getCurrentUID();
    getComments();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('UsersDetails')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid ='';
  void getCurrentUID()async{
    uid = await _auth.currentUser!.uid;
  }
  void getComments() async{
    try {
      QuerySnapshot snap =  await FirebaseFirestore.instance.collection('posts').doc(widget.snap['postId']).collection('comments').get();
      commentLength = snap.docs.length;
    }catch(e){print(e.toString());}
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            elevation: 0.0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 130, right: 130),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(500))),
                      child: Divider(
                        thickness: 5,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Comments",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          body:Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 15,
                      shadowColor: Colors.white54,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                            size: Size.fromRadius(150), // Image radius
                            child: Image.network(widget.snap['postImg'], fit: BoxFit.cover)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                    child: Row(
                      children: [
                        widget.snap['likes'].contains(uid) ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_outline_rounded,),
                        Text('${widget.snap['likes'].length}',style: GoogleFonts.tinos(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(width: 30,),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.comment_outlined,color: Colors.white,)),
                        Text("${commentLength}",style: GoogleFonts.tinos(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      ],
                    ),
                  )
                ],
              ),
              Flexible(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .doc(widget.snap['postId'])
                      .collection('comments')
                      .orderBy('datePublished', descending: true)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => CommentCard(
                          snap: snapshot.data!.docs[index].data(),
                        ));
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color.fromRGBO(210, 210, 210, 1.0)),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: TextFormField(
                        controller: controller,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Comment as ${username}",
                          hintStyle: TextStyle(fontSize: 13),
                          border: InputBorder.none,
                          filled: true,
                        ))),
                SizedBox(
                  width: 5,
                ),
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(width: 2, color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: IconButton(
                        onPressed: () async {
                          await FirestoreMethods().postComment(
                              widget.snap['postId'],
                              controller.text,
                              widget.snap['uid'],
                              username);
                          controller.clear();
                        },
                        icon: Icon(Icons.near_me_outlined)))
              ],
            ),
          ),
        ),
    ));
  }
}
