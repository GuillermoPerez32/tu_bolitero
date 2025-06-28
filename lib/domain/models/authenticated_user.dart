// To parse this JSON data, do
//
//     final auhtenticatedUser = auhtenticatedUserFromJson(jsonString);

import 'dart:convert';

AuhtenticatedUser auhtenticatedUserFromJson(String str) =>
    AuhtenticatedUser.fromJson(json.decode(str));

String auhtenticatedUserToJson(AuhtenticatedUser data) =>
    json.encode(data.toJson());

class AuhtenticatedUser {
  final User user;
  final String accessToken;

  AuhtenticatedUser({
    required this.user,
    required this.accessToken,
  });

  AuhtenticatedUser copyWith({
    User? user,
    String? accessToken,
  }) =>
      AuhtenticatedUser(
        user: user ?? this.user,
        accessToken: accessToken ?? this.accessToken,
      );

  factory AuhtenticatedUser.fromJson(Map<String, dynamic> json) =>
      AuhtenticatedUser(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
      };
}

class User {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final bool esPronosticador;
  final String? photo;
  final List<dynamic> followers;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.esPronosticador,
    required this.photo,
    required this.followers,
  });

  User copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    bool? esPronosticador,
    String? photo,
    List<dynamic>? followers,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        esPronosticador: esPronosticador ?? this.esPronosticador,
        photo: photo ?? this.photo,
        followers: followers ?? this.followers,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        esPronosticador: json["es_pronosticador"],
        photo: json["photo"] ?? '',
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
      );

  factory User.fromAuhtenticatedUser(AuhtenticatedUser auhtenticatedUser) =>
      User(
        id: auhtenticatedUser.user.id,
        username: auhtenticatedUser.user.username,
        firstName: auhtenticatedUser.user.firstName,
        lastName: auhtenticatedUser.user.lastName,
        email: auhtenticatedUser.user.email,
        esPronosticador: auhtenticatedUser.user.esPronosticador,
        photo: auhtenticatedUser.user.photo,
        followers: auhtenticatedUser.user.followers,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "es_pronosticador": esPronosticador,
        "photo": photo,
        "followers": List<dynamic>.from(followers.map((x) => x)),
      };
}
