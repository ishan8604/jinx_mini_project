class UserPostModel {
  final String caption;
  final String uid;
  final String username;
  final String postId;
  final datepublished;
  final String location;
  final String postImg;
  final likes;
  final String profileImg;

  const UserPostModel(
      {required this.caption,
        required this.uid,
        required this.username,
        required this.postId,
        required this.datepublished,
        required this.postImg,
        required this.likes,
        required this.location,
        required this.profileImg
      });

  Map<String,dynamic> toJson() =>{
    'username': username,
    'uid': uid,
    'caption': caption,
    'postId': postId,
    'datepublished': datepublished,
    'postImg':postImg,
    'likes': likes,
    'location': location,
    'profileImg':profileImg
  };

}
