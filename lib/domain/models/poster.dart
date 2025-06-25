class Poster {
  final int id;
  final String username;
  final String email;
  final dynamic photo;
  final int followersCount;

  Poster({
    required this.id,
    required this.username,
    required this.email,
    required this.photo,
    required this.followersCount,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        photo: json["photo"],
        followersCount: json["followers_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "photo": photo,
        "followers_count": followersCount,
      };
}
