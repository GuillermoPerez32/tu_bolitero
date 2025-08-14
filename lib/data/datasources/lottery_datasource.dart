import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:dio/dio.dart';
import 'package:tu_bolitero/core/api.dart';

class LotteryDatasource {
  final _client = Dio();

  LotteryDatasource() {
    _client.interceptors.add(AuthInterceptor());
  }

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

  Future<void> likeResult(int resultId) async {
    try {
      await _client.post('$host/api/registros/$resultId/like/');
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> unlikeResult(int resultId) async {
    try {
      await _client.post('$host/api/registros/$resultId/unlike/');
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<List<ResultComment>> getResultComments(int resultId) async {
    try {
      final response =
          await _client.get('$host/api/registros/$resultId/comments');
      final data = response.data as List;
      final comments = data.map((c) => ResultComment.fromJson(c)).toList();
      return comments;
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> addResultComment(int resultId, String comment) async {
    try {
      await _client.post('$host/api/registros/$resultId/comment/', data: {
        'comment': comment,
      });
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }
}

final lotteryDatasource = LotteryDatasource();
