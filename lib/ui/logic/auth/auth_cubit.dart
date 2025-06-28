import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tu_bolitero/data/datasources/auth_datasource.dart';
import 'package:tu_bolitero/domain/models/authenticated_user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  void login({required String username, required String password}) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      emit(const AuthState.loading());
      final authtenticatedUser = await authDatasource.login(username, password);
      prefs.setString('user', jsonEncode(authtenticatedUser.toJson()));
      emit(AuthState.loaded(authtenticatedUser));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  void register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      emit(const AuthState.loading());
      await authDatasource.register(username, email, password, confirmPassword);
      emit(const AuthState.success());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  void forgotPassword({required String email}) async {
    try {
      emit(const AuthState.loading());
      await authDatasource.forgotPassword(email);
      emit(const AuthState.success());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  void loadLocalUser() async {
    emit(const AuthState.loading());
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.get('user');
    if (user != null) {
      emit(AuthState.loaded(
          AuhtenticatedUser.fromJson(jsonDecode(user as String))));
    } else {
      emit(const AuthState.notLoggedIn());
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    emit(const AuthState.notLoggedIn());
  }
}
