import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tu_bolitero/data/datasources/auth_datasource.dart';
import 'package:tu_bolitero/domain/models/authenticated_user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial(null));

  void login({required String username, required String password}) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      emit(const AuthState.loading(null));
      final user = await authDatasource.login(username, password);
      prefs.setString('user', jsonEncode(user.user.toJson()));
      prefs.setString('access_token', user.accessToken);
      final authUser = User.fromAuhtenticatedUser(user);
      emit(AuthState.loaded(authUser));
    } catch (e) {
      emit(AuthState.error(e.toString(), null));
    }
  }

  void register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      emit(const AuthState.loading(null));
      await authDatasource.register(username, email, password, confirmPassword);
      emit(const AuthState.success(null));
    } catch (e) {
      emit(AuthState.error(e.toString(), null));
    }
  }

  void forgotPassword({required String email}) async {
    try {
      emit(const AuthState.loading(null));
      await authDatasource.forgotPassword(email);
      emit(const AuthState.success(null));
    } catch (e) {
      emit(AuthState.error(e.toString(), null));
    }
  }

  void loadLocalUser() async {
    emit(const AuthState.loading(null));
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    final user = prefs.get('user');
    if (user != null) {
      emit(AuthState.loaded(User.fromJson(jsonDecode(user as String))));
    } else {
      emit(const AuthState.notLoggedIn(null));
    }
  }

  void getProfile() async {
    emit(const AuthState.loading(null));
    final user = await authDatasource.getProfile();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
    emit(AuthState.loaded(user));
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    emit(const AuthState.notLoggedIn(null));
  }

  Future<void> updateProfile({
    String? username,
    String? email,
    File? photo,
  }) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    try {
      emit(AuthState.loading(currentState.user));
      final updatedUser = await authDatasource.updateProfile(
        username: username,
        email: email,
        photo: photo,
      );

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(updatedUser.toJson()));
      emit(AuthState.loaded(updatedUser));
    } catch (e) {
      emit(AuthState.error(e.toString(), currentState.user));
      emit(AuthState.loaded(currentState.user));
      rethrow;
    }
  }
}
