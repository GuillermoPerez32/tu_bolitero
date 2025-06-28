part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial(User? user) = _Initial;
  const factory AuthState.loading(User? user) = _Loading;
  const factory AuthState.notLoggedIn(User? user) = _NotLoggedIn;
  const factory AuthState.success(User? user) = _Success;
  const factory AuthState.error(String message, User? user) = _Error;
  const factory AuthState.loaded(User user) = _Loaded;
}
