// To parse this JSON data, do
//
//     final postComment = postCommentFromJson(jsonString);

import 'dart:convert';

import 'package:tu_bolitero/domain/models/user.dart';

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
