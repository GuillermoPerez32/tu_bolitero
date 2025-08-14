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
