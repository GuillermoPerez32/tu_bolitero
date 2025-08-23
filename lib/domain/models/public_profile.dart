// To parse this JSON data, do
//
//     final publicProfile = publicProfileFromJson(jsonString);

import 'dart:convert';

PublicProfile publicProfileFromJson(String str) =>
    PublicProfile.fromJson(json.decode(str));

String publicProfileToJson(PublicProfile data) => json.encode(data.toJson());

class PublicProfile {
  final int? id;
  final String? username;
  final String? email;
  final String? photo;
  final String? info;
  final int? followersCount;
  final List<Post>? posts;
  final List<ProfilePost>? profilePosts;

  PublicProfile({
    this.id,
    this.username,
    this.email,
    this.photo,
    this.info,
    this.followersCount,
    this.posts,
    this.profilePosts,
  });

  PublicProfile copyWith({
    int? id,
    String? username,
    String? email,
    String? photo,
    String? info,
    int? followersCount,
    List<Post>? posts,
    List<ProfilePost>? profilePosts,
  }) =>
      PublicProfile(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        photo: photo ?? this.photo,
        info: info ?? this.info,
        followersCount: followersCount ?? this.followersCount,
        posts: posts ?? this.posts,
        profilePosts: profilePosts ?? this.profilePosts,
      );

  factory PublicProfile.fromJson(Map<String, dynamic> json) => PublicProfile(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        photo: json["photo"],
        info: json["info"],
        followersCount: json["followers_count"],
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
        profilePosts: json["profile_posts"] == null
            ? []
            : List<ProfilePost>.from(
                json["profile_posts"]!.map((x) => ProfilePost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "photo": photo,
        "info": info,
        "followers_count": followersCount,
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
        "profile_posts": profilePosts == null
            ? []
            : List<dynamic>.from(profilePosts!.map((x) => x.toJson())),
      };
}

class Post {
  final int? id;
  final User? user;
  final String? numbers;
  final DateTime? fecha;
  final int? likesCount;
  final int? commentsCount;
  final Lottery? lottery;
  final DateTime? fechaPredicha;
  final Horario? horario;
  final String? guessedNumber;

  Post({
    this.id,
    this.user,
    this.numbers,
    this.fecha,
    this.likesCount,
    this.commentsCount,
    this.lottery,
    this.fechaPredicha,
    this.horario,
    this.guessedNumber,
  });

  Post copyWith({
    int? id,
    User? user,
    String? numbers,
    DateTime? fecha,
    int? likesCount,
    int? commentsCount,
    Lottery? lottery,
    DateTime? fechaPredicha,
    Horario? horario,
    String? guessedNumber,
  }) =>
      Post(
        id: id ?? this.id,
        user: user ?? this.user,
        numbers: numbers ?? this.numbers,
        fecha: fecha ?? this.fecha,
        likesCount: likesCount ?? this.likesCount,
        commentsCount: commentsCount ?? this.commentsCount,
        lottery: lottery ?? this.lottery,
        fechaPredicha: fechaPredicha ?? this.fechaPredicha,
        horario: horario ?? this.horario,
        guessedNumber: guessedNumber ?? this.guessedNumber,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        numbers: json["numbers"],
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        likesCount: json["likes_count"],
        commentsCount: json["comments_count"],
        lottery:
            json["lottery"] == null ? null : Lottery.fromJson(json["lottery"]),
        fechaPredicha: json["fecha_predicha"] == null
            ? null
            : DateTime.parse(json["fecha_predicha"]),
        horario: horarioValues.map[json["horario"]]!,
        guessedNumber: json["guessed_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "numbers": numbers,
        "fecha": fecha?.toIso8601String(),
        "likes_count": likesCount,
        "comments_count": commentsCount,
        "lottery": lottery?.toJson(),
        "fecha_predicha": fechaPredicha?.toIso8601String(),
        "horario": horarioValues.reverse[horario],
        "guessed_number": guessedNumber,
      };
}

enum Horario { MAANA, TARDE }

final horarioValues =
    EnumValues({"mañana": Horario.MAANA, "tarde": Horario.TARDE});

class Lottery {
  final int? id;
  final String? slug;
  final String? nombre;
  final String? logo;
  final String? pick3Logo;
  final String? pick4Logo;
  final Ultim? ultima;
  final List<Ultim>? ultimoDia;
  final bool? mostrarEnApk;

  Lottery({
    this.id,
    this.slug,
    this.nombre,
    this.logo,
    this.pick3Logo,
    this.pick4Logo,
    this.ultima,
    this.ultimoDia,
    this.mostrarEnApk,
  });

  Lottery copyWith({
    int? id,
    String? slug,
    String? nombre,
    String? logo,
    String? pick3Logo,
    String? pick4Logo,
    Ultim? ultima,
    List<Ultim>? ultimoDia,
    bool? mostrarEnApk,
  }) =>
      Lottery(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        nombre: nombre ?? this.nombre,
        logo: logo ?? this.logo,
        pick3Logo: pick3Logo ?? this.pick3Logo,
        pick4Logo: pick4Logo ?? this.pick4Logo,
        ultima: ultima ?? this.ultima,
        ultimoDia: ultimoDia ?? this.ultimoDia,
        mostrarEnApk: mostrarEnApk ?? this.mostrarEnApk,
      );

  factory Lottery.fromJson(Map<String, dynamic> json) => Lottery(
        id: json["id"],
        slug: json["slug"],
        nombre: json["nombre"],
        logo: json["logo"],
        pick3Logo: json["pick3_logo"],
        pick4Logo: json["pick4_logo"],
        ultima: json["ultima"] == null ? null : Ultim.fromJson(json["ultima"]),
        ultimoDia: json["ultimo_dia"] == null
            ? []
            : List<Ultim>.from(
                json["ultimo_dia"]!.map((x) => Ultim.fromJson(x))),
        mostrarEnApk: json["mostrar_en_apk"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "nombre": nombre,
        "logo": logo,
        "pick3_logo": pick3Logo,
        "pick4_logo": pick4Logo,
        "ultima": ultima?.toJson(),
        "ultimo_dia": ultimoDia == null
            ? []
            : List<dynamic>.from(ultimoDia!.map((x) => x.toJson())),
        "mostrar_en_apk": mostrarEnApk,
      };
}

class Ultim {
  final DateTime? fecha;
  final String? pick3;
  final String? pick4;
  final int? tirada;
  final dynamic fechaSiguiente;
  final Horario? horario;
  final int? id;
  final int? likesCount;
  final int? commentsCount;

  Ultim({
    this.fecha,
    this.pick3,
    this.pick4,
    this.tirada,
    this.fechaSiguiente,
    this.horario,
    this.id,
    this.likesCount,
    this.commentsCount,
  });

  Ultim copyWith({
    DateTime? fecha,
    String? pick3,
    String? pick4,
    int? tirada,
    dynamic fechaSiguiente,
    Horario? horario,
    int? id,
    int? likesCount,
    int? commentsCount,
  }) =>
      Ultim(
        fecha: fecha ?? this.fecha,
        pick3: pick3 ?? this.pick3,
        pick4: pick4 ?? this.pick4,
        tirada: tirada ?? this.tirada,
        fechaSiguiente: fechaSiguiente ?? this.fechaSiguiente,
        horario: horario ?? this.horario,
        id: id ?? this.id,
        likesCount: likesCount ?? this.likesCount,
        commentsCount: commentsCount ?? this.commentsCount,
      );

  factory Ultim.fromJson(Map<String, dynamic> json) => Ultim(
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        pick3: json["pick3"],
        pick4: json["pick4"],
        tirada: json["tirada"],
        fechaSiguiente: json["fecha_siguiente"],
        horario: horarioValues.map[json["horario"]]!,
        id: json["id"],
        likesCount: json["likes_count"],
        commentsCount: json["comments_count"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha?.toIso8601String(),
        "pick3": pick3,
        "pick4": pick4,
        "tirada": tirada,
        "fecha_siguiente": fechaSiguiente,
        "horario": horarioValues.reverse[horario],
        "id": id,
        "likes_count": likesCount,
        "comments_count": commentsCount,
      };
}

class User {
  final int? id;
  final String? username;
  final String? email;
  final String? photo;
  final String? info;

  User({
    this.id,
    this.username,
    this.email,
    this.photo,
    this.info,
  });

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? photo,
    String? info,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        photo: photo ?? this.photo,
        info: info ?? this.info,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        photo: json["photo"],
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "photo": photo,
        "info": info,
      };
}

class ProfilePost {
  final int? id;
  final String? photo;
  final DateTime? fecha;
  final DateTime? fechaActualizado;
  final String? description;

  ProfilePost({
    this.id,
    this.photo,
    this.fecha,
    this.fechaActualizado,
    this.description,
  });

  ProfilePost copyWith({
    int? id,
    String? photo,
    DateTime? fecha,
    DateTime? fechaActualizado,
    String? description,
  }) =>
      ProfilePost(
        id: id ?? this.id,
        photo: photo ?? this.photo,
        fecha: fecha ?? this.fecha,
        fechaActualizado: fechaActualizado ?? this.fechaActualizado,
        description: description ?? this.description,
      );

  factory ProfilePost.fromJson(Map<String, dynamic> json) => ProfilePost(
        id: json["id"],
        photo: json["photo"],
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        fechaActualizado: json["fecha_actualizado"] == null
            ? null
            : DateTime.parse(json["fecha_actualizado"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "fecha": fecha?.toIso8601String(),
        "fecha_actualizado": fechaActualizado?.toIso8601String(),
        "description": description,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
