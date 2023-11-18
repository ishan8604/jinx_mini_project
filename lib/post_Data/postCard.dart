import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/All_Screens/comment_screen.dart';
import 'package:intl/intl.dart';

import '../firestore_methods.dart';

class postCard extends StatefulWidget {
  final snap;
  const postCard({super.key,required this.snap});

  @override
  State<postCard> createState() => _postCardState();
}

class _postCardState extends State<postCard> {
  int commentLength=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUID();
    getComments();
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
                  CircleAvatar(
                    radius: 16,
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.snap['username'],style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold),),
                            Text(widget.snap['location']!,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),)
                          ],
                        ),
                      )),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
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
                                      Text("Share",
                                          style: GoogleFonts.notoSans(color: Colors.white)),
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
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Delete",
                                          style: GoogleFonts.notoSans(color: Colors.white)),
                                    ],
                                  ),
                                  onPressed: () async {},
                                ),
                              ],
                            )
                        );
                      },
                      icon: Icon(Icons.more_vert_outlined,color: Theme.of(context).colorScheme.onPrimary,))
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
                Text('${widget.snap['likes'].length}',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
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
                    icon: Icon(Icons.comment_outlined,color: Theme.of(context).colorScheme.onPrimary,)),
                Text("${commentLength}",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_border_rounded,color: Theme.of(context).colorScheme.onPrimary,),
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
                          Text(widget.snap['username'],style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold,fontSize: 15)),
                          SizedBox(height: 10,),
                          Text(widget.snap['caption']!,style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 15),)
                        ],
                      )
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Text("View all ${commentLength} Comments",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 13),),
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
