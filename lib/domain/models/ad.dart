// To parse this JSON data, do
//
//     final ad = adFromJson(jsonString);

import 'dart:convert';

Ad adFromJson(String str) => Ad.fromJson(json.decode(str));

String adToJson(Ad data) => json.encode(data.toJson());

class Ad {
  final int id;
  final String mensaje;
  final String link;
  final String imagen;
  final DateTime fechaCreado;
  final DateTime fechaActualizado;

  Ad({
    required this.id,
    required this.mensaje,
    required this.link,
    required this.imagen,
    required this.fechaCreado,
    required this.fechaActualizado,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        id: json["id"],
        mensaje: json["mensaje"],
        link: json["link"],
        imagen: json["imagen"],
        fechaCreado: DateTime.parse(json["fecha_creado"]),
        fechaActualizado: DateTime.parse(json["fecha_actualizado"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mensaje": mensaje,
        "link": link,
        "imagen": imagen,
        "fecha_creado": fechaCreado.toIso8601String(),
        "fecha_actualizado": fechaActualizado.toIso8601String(),
      };
}
