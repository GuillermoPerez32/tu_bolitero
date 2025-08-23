import 'package:dio/dio.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/core/api.dart';
import 'package:tu_bolitero/domain/models/public_profile.dart';

class PublicProfilesDatasource {
  final _client = Dio();

  PublicProfilesDatasource() {
    _client.interceptors.add(AuthInterceptor());
  }

  Future<PublicProfile> getPublicProfile(int id) async {
    try {
      final response = await _client.get('$host/api/pronosticadores/$id/');
      return PublicProfile.fromJson(response.data);
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }
}

final publicProfilesDatasource = PublicProfilesDatasource();
