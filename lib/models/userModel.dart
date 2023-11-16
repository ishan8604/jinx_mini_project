import 'dart:typed_data';

class UserModel {
  final String email;
  final String uid;
  final String username;
  final String FullName;
  final String Password;
  final List following;
  final List follower;

  const UserModel(
      {required this.email,
        required this.uid,
        required this.username,
        required this.FullName,
        required this.Password,
        required this.following,
        required this.follower});

  Map<String,dynamic> toJson() =>{
    'username': username,
    'uid': uid,
    'email': email,
    'fullname': FullName,
    'Password': Password,
    'followers': follower,
    'following': following,
    'profileImg':""
  };

}
