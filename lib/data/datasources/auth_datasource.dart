import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tu_bolitero/core/api.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/authenticated_user.dart';

class AuthDatasource {
  final _client = Dio();

  AuthDatasource() {
    _client.interceptors.add(AuthInterceptor());
  }

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

  Future<User> updateProfile({
    String? username,
    String? email,
    File? photo,
    String? info,
    String? firstName,
    String? lastName,
  }) async {
    try {
      final formData = FormData.fromMap({
        if (username != null) 'username': username,
        if (email != null) 'email': email,
        if (photo != null)
          'photo': await MultipartFile.fromFile(
            photo.path,
            filename: photo.absolute.path.split('/').last,
          ),
        if (info != null) 'info': info,
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
      });

      final response = await _client.patch(
        '$host/api/auth/users/2/',
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      );

      return User.fromJson(response.data);
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<User> getProfile() async {
    try {
      final response = await _client.get('$host/api/auth/users/2/');
      return User.fromJson(response.data);
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }
}

final authDatasource = AuthDatasource();
