import 'dart:convert';

List<CharadaNumber> charadaNumberFromJson(String str) =>
    List<CharadaNumber>.from(
        json.decode(str).map((x) => CharadaNumber.fromJson(x)));

String charadaNumberToJson(List<CharadaNumber> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharadaNumber {
  final String number;
  final String principal;
  final List<String> meanings;

  CharadaNumber({
    required this.number,
    required this.principal,
    required this.meanings,
  });

  factory CharadaNumber.fromJson(Map<String, dynamic> json) => CharadaNumber(
        number: json["number"],
        principal: json["principal"],
        meanings: List<String>.from(json["meanings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "principal": principal,
        "meanings": List<dynamic>.from(meanings.map((x) => x)),
      };
}
