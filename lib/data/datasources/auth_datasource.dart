import 'package:dio/dio.dart';
import 'package:tu_bolitero/core/api.dart';
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
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> register(String username, String email, String password,
      String confirmPassword) async {
    try {
      await _client.post('$host/api/auth/signup/', data: {
        'username': username,
        'email': email,
        'password': password,
        'passwd_conf': confirmPassword,
      });
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _client.post('$host/api/auth/forgot-password/', data: {
        'email': email,
      });
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }
}

final authDatasource = AuthDatasource();
