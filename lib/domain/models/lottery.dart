import 'dart:convert';

Lottery lotteryFromJson(String str) => Lottery.fromJson(json.decode(str));

String lotteryToJson(Lottery data) => json.encode(data.toJson());

class Lottery {
  final int id;
  final String nombre;
  final String logo;
  final String? pick3Logo;
  final String? pick4Logo;
  final LotteryResult? ultima;
  final List<LotteryResult> anteriores;
  final List<LotteryResult> ultimoDia;
  final Atrasados? atrasados;

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
    Atrasados? atrasados,
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
            : Atrasados.fromJson(json["atrasados"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "logo": logo,
        "pick3_logo": pick3Logo,
        "pick4_logo": pick4Logo,
        "ultima": ultima?.toJson(),
        "anteriores": List<dynamic>.from(anteriores.map((x) => x.toJson())),
        "ultimo_dia": List<dynamic>.from(ultimoDia.map((x) => x.toJson())),
        "atrasados": atrasados?.toJson(),
      };
}

class LotteryResult {
  final DateTime fecha;
  final String pick3;
  final String pick4;
  final int tirada;
  final DateTime? fechaSiguiente;

  LotteryResult({
    required this.fecha,
    required this.pick3,
    required this.pick4,
    required this.tirada,
    this.fechaSiguiente,
  });

  factory LotteryResult.fromJson(Map<String, dynamic> json) => LotteryResult(
        fecha: DateTime.parse(json["fecha"]),
        pick3: json["pick3"],
        pick4: json["pick4"],
        tirada: json["tirada"],
        fechaSiguiente: json["fecha_siguiente"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "pick3": pick3,
        "pick4": pick4,
        "tirada": tirada,
        "fecha_siguiente": fechaSiguiente,
      };
}

class Atrasados {
  final Map<String, int>? decenas;
  final Map<String, int>? centenas;
  final Map<String, int>? unidades;

  Atrasados({
    this.decenas,
    this.centenas,
    this.unidades,
  });

  factory Atrasados.fromJson(Map<String, dynamic> json) => Atrasados(
        decenas: Map.from(json["decenas"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        centenas: Map.from(json["centenas"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        unidades: Map.from(json["unidades"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "decenas":
            Map.from(decenas!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "centenas":
            Map.from(centenas!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "unidades":
            Map.from(unidades!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
