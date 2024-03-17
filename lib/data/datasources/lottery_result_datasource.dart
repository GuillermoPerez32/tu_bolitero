import 'package:tu_bolitero/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:tu_bolitero/domain/models/lottery_result.dart';

class LotteryResultsDatasource {
  final _client = Dio();

  Future<List<LotteryResult>> getLotteryResult(int id) async {
    final response = await _client.get('$host/api/loterias/$id/anteriores');
    final data = response.data as List;
    final results =
        data.map((result) => LotteryResult.fromJson(result)).toList();
    return results;
  }
}

final lotteryResultsDatasource = LotteryResultsDatasource();
