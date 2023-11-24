import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/post_Data/postCard.dart';
import 'package:jinx/Dm_window/dm_window.dart';

class feed extends StatefulWidget {
  const feed({super.key});

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color.fromRGBO(23, 22, 22, 1.0),
          appBar: AppBar(
            backgroundColor: Colors.black,
          title: Text("JINX",style: GoogleFonts.sriracha(color: Color.fromRGBO(216, 249, 217, 1.0)),),
          actions: [
            IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>dm_window()));}, icon: Icon(Icons.messenger_outline,color: Color.fromRGBO(216, 249, 217, 1.0),)),
            ],
          ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context , AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.black,),);
            }
            return ListView.builder(
              itemCount:  snapshot.data!.docs.length,
              itemBuilder: (context,index) => postCard(
                snap: snapshot.data!.docs![index].data(),
              ),
            );
          },
        ),
    )
      ],
    );
  }
}
//(snapshot.data!).docs![index]['profileImg']