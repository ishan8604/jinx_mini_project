import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/All_Screens/comment_screen.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../firestore_methods.dart';

class postCard extends StatefulWidget {
  final snap;
  const postCard({super.key,required this.snap});

  @override
  State<postCard> createState() => _postCardState();
}

class _postCardState extends State<postCard> {
  int commentLength=0;
  bool profileImag=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUID();
    getComments();
    getprofileImg();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid ='';
  void getCurrentUID()async{
    uid = await _auth.currentUser!.uid;
  }
  void getprofileImg(){
    if(widget.snap['profileImg']==""){
      setState(() {
        profileImag=false;
      });
    }
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
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5,top: 4,bottom: 4),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.black,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6)
                  .copyWith(right: 0),
              child: Row(
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.black
                      ),
                      child: widget.snap['profileImg']==null?ClipRRect(child: Image.network("https://www.wissetuinen.nl/wp-content/uploads/2016/01/profiel-icoon.jpg",fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),):ClipRRect(child: Image.network(widget.snap['profileImg'],fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),)
                  ),                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.snap['username'],style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0),fontWeight: FontWeight.bold),),
                            Text(widget.snap['location']!,style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      )),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => widget.snap['uid']==uid?
                                SimpleDialog(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              children: [
                                SimpleDialogOption(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.telegram_outlined,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(onPressed: ()async{
                                          final urlImage = widget.snap['postImg'];
                                          final url = Uri.parse(urlImage);
                                          final response = await http.get(url);
                                          Share.shareXFiles(
                                              [
                                            XFile.fromData(
                                                response.bodyBytes,
                                                name:widget.snap['username'],
                                                mimeType: 'image/png'
                                            ),
                                          ],
                                            subject: widget.snap['username'],
                                            text: "@"+widget.snap['username']
                                          );

                                      },
                                          child: Text("Share", style: GoogleFonts.notoSans(color: Colors.white))),
                                    ],
                                  ),
                                  onPressed: () async {},
                                ),
                                SimpleDialogOption(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.telegram_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(
                                        onPressed: ()async{
                                          FirestoreMethods().deletePost(widget.snap['postId']);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Delete",
                                            style: GoogleFonts.notoSans(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {},
                                ),
                              ],
                            ):SimpleDialog(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              children: [
                                SimpleDialogOption(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.telegram_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(onPressed: ()async{
                                        final urlImage = widget.snap['postImg'];
                                        final url = Uri.parse(urlImage);
                                        final response = await http.get(url);
                                        Share.shareXFiles(
                                            [
                                              XFile.fromData(
                                                  response.bodyBytes,
                                                  name:widget.snap['username'],
                                                  mimeType: 'image/png'
                                              ),
                                            ],
                                            subject: widget.snap['username'],
                                            text: "@"+widget.snap['username']
                                        );

                                      },
                                          child: Text("Share", style: GoogleFonts.notoSans(color: Colors.white))),
                                    ],
                                  ),
                                  onPressed: () async {},
                                ),
                              ],
                            )
                        );
                      },
                      icon: Icon(Icons.more_vert_outlined,color: Colors.white,))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Card(
                color: Colors.transparent,
                elevation: 20,
                shadowColor: Colors.blueGrey,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                      size: Size.fromRadius(180), // Image radius
                      child: Image.network(widget.snap['postImg'],fit: BoxFit.cover,)
                  ),
                ),
              ),
            ),

            //Like,Comment Section
            Row(
              children: [
                IconButton(
                    onPressed: ()async{
                      await FirestoreMethods().likePost(widget.snap['postId'],uid,widget.snap['likes']);
                    },
                    icon: widget.snap['likes'].contains(uid) ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_outline_rounded,)
                ),
                Text('${widget.snap['likes'].length}',style: TextStyle(color: Colors.white),),
                SizedBox(width: 30,),
                IconButton(
                    onPressed: (){
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context, builder: (context) => comment_screen(
                        snap:widget.snap,
                      ));
                      },
                    icon: Icon(Icons.comment_outlined,color: Colors.white,)),
                Text("${commentLength}",style: TextStyle(color: Colors.white),),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_border_rounded,color: Colors.white,),
                        )))
              ],
            ),

            //Caption and no. of comments
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.snap['username'],style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0),fontWeight: FontWeight.bold,fontSize: 15)),
                          SizedBox(height: 10,),
                          Text(widget.snap['caption']!,style: TextStyle(color: Color.fromRGBO(22, 128, 57, 1.0),fontWeight: FontWeight.bold,fontSize: 15),)
                        ],
                      )
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Text("View all ${commentLength} Comments",style: TextStyle(color: Colors.white,fontSize: 13),),
                      padding: EdgeInsets.symmetric(vertical: 4)
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(DateFormat.yMMMd().format(widget.snap['datepublished'].toDate()) ,style: TextStyle(fontSize: 12),),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
