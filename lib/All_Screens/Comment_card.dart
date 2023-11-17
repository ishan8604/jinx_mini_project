import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            CircleAvatar(
              radius: 18,
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
                                  text: "_bhagyodaya__varshney",
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16)
                              ),
                              TextSpan(text: "  "),
                              TextSpan(
                                  text: "WOW",
                                  style: TextStyle(color: Colors.white,fontSize: 16)
                              )
                            ]
                        )
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: ()async{},
                          icon: Icon(Icons.favorite_outline_rounded,size: 15,color: Colors.white,),),
                        Text("2",style: TextStyle(fontSize: 10,color: Colors.white),)
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 4),
                      child: Text("10/11/2023",
                        style: TextStyle(fontSize: 12,color: Colors.white),
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
