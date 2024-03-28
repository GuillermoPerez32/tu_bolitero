import 'dart:convert';

import 'package:tu_bolitero/domain/models/charada_number.dart';
import 'package:flutter/services.dart' show rootBundle;

class CharadaClasicaDatasource {
  const CharadaClasicaDatasource();

  Future<List<CharadaNumber>> getCharadaClasica() async {
    String jsonString =
        await rootBundle.loadString('assets/charada_clasica.json');
    List<dynamic> jsonList = json.decode(jsonString);
    List<CharadaNumber> charadaList =
        jsonList.map((json) => CharadaNumber.fromJson(json)).toList();
    return charadaList;
  }
}
