// To parse this JSON data, do
//
//     final postComment = postCommentFromJson(jsonString);

import 'dart:convert';

PostComment postCommentFromJson(String str) =>
    PostComment.fromJson(json.decode(str));

String postCommentToJson(PostComment data) => json.encode(data.toJson());

class PostComment {
  final int id;
  final User user;
  final int post;
  final String comment;

  PostComment({
    required this.id,
    required this.user,
    required this.post,
    required this.comment,
  });

  factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
        id: json["id"],
        user: User.fromJson(json["user"]),
        post: json["post"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "post": post,
        "comment": comment,
      };
}

class User {
  final int id;
  final String username;
  final String email;
  final String? photo;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        photo: json["photo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "photo": photo,
      };
}
