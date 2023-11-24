import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../firestore_methods.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({super.key,required this.snap});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUID();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid ='';
  void getCurrentUID()async{
    uid = await _auth.currentUser!.uid;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image.network(widget.snap['profileImg']==null?"https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png":widget.snap['profileImg'],fit: BoxFit.cover,),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: widget.snap['username'],
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16)
                              ),
                              TextSpan(text: "  "),
                              TextSpan(
                                  text: widget.snap['text'],
                                  style: TextStyle(color: Colors.white,fontSize: 16)
                              )
                            ]
                        )
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: ()async{
                          await FirestoreMethods().likeComment(widget.snap['postId'],uid,widget.snap['commentId'],widget.snap['likes']);
                        },
                          icon: widget.snap['likes'].contains(uid) ? Icon(Icons.favorite,color: Colors.red,size: 15,) : Icon(Icons.favorite_outline_rounded,size: 15,),),
                        Text('${widget.snap['likes'].length}',style: TextStyle(fontSize: 10),)
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 4),
                      child: Text(
                        DateFormat.yMMMd().format(widget.snap['datePublished'].toDate()),
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
