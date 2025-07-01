import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:dio/dio.dart';

class LotteryDatasource {
  final _client = Dio();

  Future<List<Lottery>> getLotteries() async {
    final response = await _client.get('$host/api/loterias');
    final data = response.data as List;
    final lotteries = data
        .map((lottery) => Lottery.fromJson(lottery))
        .where((lottery) => lottery.mostrarEnApk == true)
        .toList();
    return lotteries;
  }

  Future<List<LotteryResult>> getLotteryResult(int id) async {
    final response = await _client.get('$host/api/loterias/$id');
    final data = response.data['anteriores'] as List;
    final results =
        data.map((result) => LotteryResult.fromJson(result)).toList();
    return results;
  }

  Future<Map<String, Atrasados>> getAtrasados(int id) async {
    final response = await _client.get('$host/api/loterias/$id');
    final data = (response.data['atrasados'] as Map<String, dynamic>);
    final Map<String, Atrasados> result = {
      for (var horario in data.entries)
        horario.key: Atrasados.fromJson(horario.value)
    };
    return result;
  }
}

final lotteryDatasource = LotteryDatasource();
