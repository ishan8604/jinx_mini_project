import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jinx/Dm_window/dm_services.dart';

class dm_main_window extends StatefulWidget {
  final String profileImg;
  final String username;
  final String fullname;
  final String receiverUid;
  final String receiverEmail;
  const dm_main_window({super.key,required this.profileImg,required this.username,required this.fullname,required this.receiverEmail,required this.receiverUid});

  @override
  State<dm_main_window> createState() => _dm_main_windowState();
}

class _dm_main_windowState extends State<dm_main_window> {

  TextEditingController msgcontroller = TextEditingController();
  final dm_services _dmServices = dm_services();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage()async{
    if(msgcontroller.text.isNotEmpty){
      await _dmServices.sendMessage(widget.receiverUid, msgcontroller.text);
      msgcontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset("assets/background1.png",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: Colors.black,
              //automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.black45
                      ),
                      child: widget.profileImg==""?ClipRRect(child: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),):ClipRRect(child: Image.network(widget.profileImg,fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(50)),)
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Text("@"+widget.username,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      Text(widget.fullname,style: TextStyle(fontSize: 15,color: Colors.white54),)
                    ],
                  )
                ],
              ),),
            body: Column(
              children: [
                //msg
                Expanded(
                    child: _buildMessageList(),
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
                          controller: msgcontroller,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Write here...",
                            filled: true,
                            fillColor: Colors.white54,
                            suffixIcon: IconButton(icon: Icon(Icons.attachment_rounded),onPressed: (){},)
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
                          onPressed: sendMessage,
                          icon: Icon(Icons.near_me_outlined)))
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
  //build message List
  Widget _buildMessageList(){
    return StreamBuilder(stream: _dmServices.getMessage(widget.receiverUid, _firebaseAuth.currentUser!.uid),
        builder: (context,snapshot){
      if(snapshot.hasError) return Text("Error");
      if(snapshot.connectionState==ConnectionState.waiting) return Text("Loading...");
      return ListView(
        children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList()
      );
        }
    );
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId']==_firebaseAuth.currentUser!.uid)?Alignment.centerRight:Alignment.centerLeft;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black45,
              ),
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data['message'],style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 17,color: Color.fromRGBO(216, 249, 217, 1.0)),),
          )),
        ),
      ),
    );
  }


}
