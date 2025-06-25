import 'dart:convert';

import 'package:tu_bolitero/domain/models/post_comment.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  final int id;
  final User user;
  final String numbers;
  final DateTime fecha;
  final int likesCount;
  final int commentsCount;
  final List<PostComment>? comments;

  Post({
    required this.id,
    required this.user,
    required this.numbers,
    required this.fecha,
    required this.likesCount,
    required this.commentsCount,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        user: User.fromJson(json["user"]),
        numbers: json["numbers"],
        fecha: DateTime.parse(json["fecha"]),
        likesCount: json["likes_count"],
        commentsCount: json["comments_count"],
        comments: json["comments"] == null
            ? []
            : List<PostComment>.from(
                json["comments"].map((x) => PostComment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "numbers": numbers,
        "fecha": fecha.toIso8601String(),
        "likes_count": likesCount,
        "comments_count": commentsCount,
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
      };

  Post copyWith({
    int? id,
    User? user,
    String? numbers,
    DateTime? fecha,
    int? likesCount,
    int? commentsCount,
    List<PostComment>? comments,
  }) =>
      Post(
        id: id ?? this.id,
        user: user ?? this.user,
        numbers: numbers ?? this.numbers,
        fecha: fecha ?? this.fecha,
        likesCount: likesCount ?? this.likesCount,
        commentsCount: commentsCount ?? this.commentsCount,
        comments: comments ?? this.comments,
      );
}
