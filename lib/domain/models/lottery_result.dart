class LotteryResult {
  final DateTime fecha;
  final String pick3;
  final String pick4;
  final int tirada;
  final dynamic fechaSiguiente;

  LotteryResult({
    required this.fecha,
    required this.pick3,
    required this.pick4,
    required this.tirada,
    required this.fechaSiguiente,
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
