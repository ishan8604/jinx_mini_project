import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jinx/storage_methods.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'models/userPostModel.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String res = "";
  bool likeOrNot=false;
  String commentWarning="";
  Future<String> uploadPost(
      String description,
      String uid,
      String username,
      String location,
      Uint8List file,
      String profileImg) async {
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();
      UserPostModel userPostModel = UserPostModel(
          caption: description,
          uid: uid,
          username: username,
          postId: postId,
          datepublished: DateTime.now(),
          postImg: photoUrl,
          likes: [],
          location: location,
        profileImg: profileImg
      );

      _firestore.collection('posts').doc(postId).set(userPostModel.toJson());
      res = "Success";

    } catch (err) {
      print("Complete");
      res=err.toString();
    }
    return res;
  }

  Future<void> likePost(String postId,String uid,List likes) async{
    try{
      if(likes.contains(uid)){
        await _firestore.collection('posts').doc(postId).update({
          'likes':FieldValue.arrayRemove([uid]),
        });
        likeOrNot=false;
      }
      else{
        await _firestore.collection('posts').doc(postId).update({
          'likes':FieldValue.arrayUnion([uid]),
        });
        likeOrNot=true;
      }
    }catch(e){
      print(e.toString());
    }
  }
  Future<void> likeComment(String postId,String uid,String commentId,List likes) async{
    try{
      if(likes.contains(uid)){
        await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).update({
          'likes':FieldValue.arrayRemove([uid]),
        });
      }
      else{
        await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).update({
          'likes':FieldValue.arrayUnion([uid]),
        });
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> postComment(String postId,String text,String uid,String username)async{
    var data = await _firestore.collection("UsersDetails").doc(_auth.currentUser!.uid).get();
    try{
      if(text.isNotEmpty){
        String commentId = Uuid().v1();
        await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set(
            {
              'postId':postId,
              'uid':uid,
              'username':username,
              'text':text,
              'commentId':commentId,
              'datePublished':DateTime.now(),
              'likes':[],
              'profileImg':(data.data() as Map<String,dynamic>)['profileImg']
            });
        commentWarning = "Commented!";
      }
      else{
        commentWarning = "Plz Comment to submit";
      }
    }
    catch(e){print(e.toString());}
  }

  Future<void> deletePost(String postId) async{
    try{
      await _firestore.collection('posts').doc(postId).delete();
    }catch(err){
      print(err.toString());
    }
  }
  
  Future<String> updateBio(String bio,Uint8List? file)async{
    try{
      String photoUrl = await StorageMethods().uploadImageToStorage("profilepics", file!, false);
      await _firestore.collection("UsersDetails").doc(_auth.currentUser?.uid).update(
          {"bio":bio,"profileImg":photoUrl});
      res = "Success";
    }
    catch(err){
      res=err.toString();
      print(res);
    }
    return res;
  }

  Future<void> updateFollow(String currentUid,String uid)async {
    try{
      DocumentSnapshot snap = await _firestore.collection("UsersDetails").doc(currentUid).get();
      List following = (snap.data()! as dynamic)['following'];

      if(following.contains(uid)){
        await _firestore.collection("UsersDetails").doc(uid).update({
              'followers': FieldValue.arrayRemove([currentUid])
            });
        await _firestore.collection("UsersDetails").doc(currentUid).update({
              'following': FieldValue.arrayRemove([uid])
            });
      }
      await _firestore.collection("UsersDetails").doc(uid).update({
            'followers': FieldValue.arrayUnion([currentUid])
          });
      await _firestore.collection("UsersDetails").doc(currentUid).update({
            'following': FieldValue.arrayUnion([uid])
          });
    }
    catch(err){
      print(err.toString());
    }
  }

}
