import 'dart:convert';

import 'package:tu_bolitero/domain/models/result.dart';

List<Lottery> lotteryFromJson(String str) =>
    List<Lottery>.from(json.decode(str).map((x) => Lottery.fromJson(x)));

String lotteryToJson(List<Lottery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lottery {
  final int id;
  final String nombre;
  final String logo;
  final String? pick3Logo;
  final String? pick4Logo;
  final Result ultima;
  final List<Result> ultimoDia;

  Lottery({
    required this.id,
    required this.nombre,
    required this.logo,
    required this.pick3Logo,
    required this.pick4Logo,
    required this.ultima,
    required this.ultimoDia,
  });

  factory Lottery.fromJson(Map<String, dynamic> json) => Lottery(
        id: json["id"],
        nombre: json["nombre"],
        logo: json["logo"],
        pick3Logo: json["pick3_logo"],
        pick4Logo: json["pick4_logo"],
        ultima: Result.fromJson(json["ultima"]),
        ultimoDia: List<Result>.from(
            json["ultimo_dia"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "logo": logo,
        "pick3_logo": pick3Logo,
        "pick4_logo": pick4Logo,
        "ultima": ultima.toJson(),
        "ultimo_dia": List<dynamic>.from(ultimoDia.map((x) => x.toJson())),
      };
}
