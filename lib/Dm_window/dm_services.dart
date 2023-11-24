import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jinx/Dm_window/dm_model.dart';

class dm_services extends ChangeNotifier{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //SEND MSG
  Future<void> sendMessage(String receiverId,String message) async {
    //get Current info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create a new Message
    dm newdm = dm(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp,
        dateTimehour: DateTime.now().hour,
      dateTimemin: DateTime.now().minute
    );

    //construct chat room id
    List<String> ids = [currentUserId,receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    //add a new msg to database
    await _firestore.collection("dm_room").doc(chatRoomId).collection("dm's").add(newdm.toMap());
  }
  //GET MSG
  Stream<QuerySnapshot> getMessage(String userId,String otherUserID){

    List<String> ids = [userId,otherUserID];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore.collection("dm_room").doc(chatRoomId).collection("dm's").orderBy('timestamp',descending: false).snapshots();
  }
}