import 'dart:typed_data';

class UserModel {
  final String email;
  final String uid;
  final String username;
  final String FullName;
  final String Password;
  final String bio;
  final List following;
  final List follower;

  const UserModel(
      {required this.email,
        required this.uid,
        required this.username,
        required this.FullName,
        required this.Password,
        required this.bio,
        required this.following,
        required this.follower});

  Map<String,dynamic> toJson() =>{
    'username': username,
    'uid': uid,
    'email': email,
    'fullname': FullName,
    'Password': Password,
    'bio':bio,
    'followers': follower,
    'following': following,
    'profileImg':"https://www.wissetuinen.nl/wp-content/uploads/2016/01/profiel-icoon.jpg"
  };

}
