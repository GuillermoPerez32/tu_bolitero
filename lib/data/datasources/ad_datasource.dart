import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/ad.dart';
import 'package:dio/dio.dart';

class AdDatasource {
  final _client = Dio();

  Future<Ad> getAd() async {
    final response = await _client.get('$host/api/anuncios');
    final data = response.data as List;
    final ad = Ad.fromJson(data[0]);
    return ad;
  }
}

final adDatasource = AdDatasource();
