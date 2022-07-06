import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String username;
  String uid;
  String email;
  String profilePic;

  UserModel({
    required this.email,
    required this.profilePic,
    required this.uid,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "uid": uid,
        "profilepic": profilePic,
      };

  static UserModel fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      email: snapshot['email'],
      profilePic: snapshot['profilePic'],
      uid: snapshot['uid'],
      username: snapshot['username'],
    );
  }
}
