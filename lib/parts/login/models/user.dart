part of '../login_part.dart';

class User {
  final String username;
  final String uid;

  const User({required this.username, required this.uid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'uid': uid,
    };
  }
}
