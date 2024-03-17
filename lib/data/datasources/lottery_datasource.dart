import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:dio/dio.dart';

class LotteryDatasource {
  final _client = Dio();

  Future<List<Lottery>> getLotteries() async {
    final response = await _client.get('$host/api/loterias');
    final data = response.data as List;
    final lotteries = data.map((lottery) => Lottery.fromJson(lottery)).toList();
    return lotteries;
  }
}

final lotteryDatasource = LotteryDatasource();
