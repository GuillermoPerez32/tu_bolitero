import 'package:dio/dio.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/authenticated_user.dart';

class AuthDatasource {
  final _client = Dio();

  Future<AuhtenticatedUser> login(String username, String password) async {
    try {
      final response = await _client.post('$host/api/auth/login/', data: {
        'username': username,
        'password': password,
      });
      final user = AuhtenticatedUser.fromJson(response.data);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}

final authDatasource = AuthDatasource();
