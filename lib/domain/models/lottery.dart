import 'dart:convert';

import 'package:tu_bolitero/domain/models/user.dart';

Lottery lotteryFromJson(String str) => Lottery.fromJson(json.decode(str));

class Lottery {
  final int id;
  final String nombre;
  final String logo;
  final String? pick3Logo;
  final String? pick4Logo;
  final LotteryResult? ultima;
  final List<LotteryResult> anteriores;
  final List<LotteryResult> ultimoDia;
  final Map<String, Atrasados>? atrasados;
  final bool? mostrarEnApk;

  Lottery({
    required this.id,
    required this.nombre,
    required this.logo,
    required this.pick3Logo,
    required this.pick4Logo,
    required this.ultima,
    required this.anteriores,
    required this.ultimoDia,
    required this.atrasados,
    required this.mostrarEnApk,
  });

  Lottery copyWith({
    int? id,
    String? nombre,
    String? logo,
    String? pick3Logo,
    String? pick4Logo,
    LotteryResult? ultima,
    List<LotteryResult>? anteriores,
    List<LotteryResult>? ultimoDia,
    Map<String, Atrasados>? atrasados,
    bool? mostrarEnApk,
  }) =>
      Lottery(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        logo: logo ?? this.logo,
        pick3Logo: pick3Logo ?? this.pick3Logo,
        pick4Logo: pick4Logo ?? this.pick4Logo,
        ultima: ultima ?? this.ultima,
        anteriores: anteriores ?? this.anteriores,
        ultimoDia: ultimoDia ?? this.ultimoDia,
        atrasados: atrasados ?? this.atrasados,
        mostrarEnApk: mostrarEnApk ?? this.mostrarEnApk,
      );

  factory Lottery.fromJson(Map<String, dynamic> json) => Lottery(
        id: json["id"],
        nombre: json["nombre"],
        logo: json["logo"],
        pick3Logo: json["pick3_logo"],
        pick4Logo: json["pick4_logo"],
        ultima: json["ultima"] == null
            ? null
            : LotteryResult.fromJson(json["ultima"]),
        anteriores: json["anteriores"] == null
            ? []
            : List<LotteryResult>.from(
                json["anteriores"]!.map((x) => LotteryResult.fromJson(x))),
        ultimoDia: json["ultimo_dia"] == null
            ? []
            : List<LotteryResult>.from(
                json["ultimo_dia"]!.map((x) => LotteryResult.fromJson(x))),
        atrasados: json["atrasados"] == null
            ? null
            : {
                for (var horario in (json["atrasados"] as Map).entries)
                  horario.key: Atrasados.fromJson(horario.value)
              },
        mostrarEnApk: json["mostrar_en_apk"],
      );
}

class LotteryResult {
  final int id;
  final DateTime fecha;
  final String pick3;
  final String pick4;
  final int tirada;
  final DateTime? fechaSiguiente;
  final int likesCount;
  final int commentsCount;
  final List<ResultComment>? comments;

  LotteryResult({
    required this.id,
    required this.fecha,
    required this.pick3,
    required this.pick4,
    required this.tirada,
    this.fechaSiguiente,
    required this.likesCount,
    required this.commentsCount,
    required this.comments,
  });

  factory LotteryResult.fromJson(Map<String, dynamic> json) => LotteryResult(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        pick3: json["pick3"],
        pick4: json["pick4"],
        tirada: json["tirada"],
        fechaSiguiente: json["fecha_siguiente"] != null
            ? DateTime.parse(json["fecha_siguiente"])
            : null,
        likesCount: json["likes_count"],
        commentsCount: json["comments_count"],
        comments: json["comments"] == null
            ? []
            : List<ResultComment>.from(
                json["comments"].map((x) => ResultComment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha.toIso8601String(),
        "pick3": pick3,
        "pick4": pick4,
        "tirada": tirada,
        "fecha_siguiente": fechaSiguiente,
        "likes_count": likesCount,
        "comments_count": commentsCount,
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
      };

  LotteryResult copyWith({
    int? id,
    DateTime? fecha,
    String? pick3,
    String? pick4,
    int? tirada,
    DateTime? fechaSiguiente,
    int? likesCount,
    int? commentsCount,
    List<ResultComment>? comments,
  }) =>
      LotteryResult(
        id: id ?? this.id,
        fecha: fecha ?? this.fecha,
        pick3: pick3 ?? this.pick3,
        pick4: pick4 ?? this.pick4,
        tirada: tirada ?? this.tirada,
        fechaSiguiente: fechaSiguiente ?? this.fechaSiguiente,
        likesCount: likesCount ?? this.likesCount,
        commentsCount: commentsCount ?? this.commentsCount,
        comments: comments ?? this.comments,
      );
}

class Atrasados {
  final Map<String, int> dobles;
  final Map<String, int> decenas;
  final Map<String, int> centenas;
  final Map<String, int> unidades;

  Atrasados({
    required this.dobles,
    required this.decenas,
    required this.centenas,
    required this.unidades,
  });

  factory Atrasados.fromJson(Map<String, dynamic> json) => Atrasados(
        dobles: json["dobles"] != null
            ? Map.from(json["dobles"])
            : {}.map((k, v) => MapEntry<String, int>(k, v)),
        decenas: json["decenas"] != null
            ? Map.from(json["decenas"])
            : {}.map((k, v) => MapEntry<String, int>(k, v)),
        centenas: json["centenas"] != null
            ? Map.from(json["centenas"])
            : {}.map((k, v) => MapEntry<String, int>(k, v)),
        unidades: json["unidades"] != null
            ? Map.from(json["unidades"])
            : {}.map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "dobles":
            Map.from(dobles).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "decenas":
            Map.from(decenas).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "centenas":
            Map.from(centenas).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "unidades":
            Map.from(unidades).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class ResultComment {
  final int id;
  final User user;
  final int registro;
  final String comment;

  ResultComment({
    required this.id,
    required this.user,
    required this.registro,
    required this.comment,
  });

  factory ResultComment.fromJson(Map<String, dynamic> json) => ResultComment(
        id: json["id"],
        user: User.fromJson(json["user"]),
        registro: json["registro"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "registro": registro,
        "comment": comment,
      };
}
