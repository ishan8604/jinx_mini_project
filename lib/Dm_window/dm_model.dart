import 'package:cloud_firestore/cloud_firestore.dart';

class dm{
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;
  final int dateTimehour;
  final int dateTimemin;

  dm({required this.senderId,required this.senderEmail,required this.receiverId,required this.message,required this.timestamp,required this.dateTimehour,required this.dateTimemin});

  Map<String,dynamic> toMap(){
    return{
      'senderId':senderId,
      'senderEmail':senderEmail,
      'receiverId':receiverId,
      'message':message,
      'timestamp':timestamp,
      'datetimehour':dateTimehour,
      'datetimemin':dateTimemin
    };
  }
}