part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.notLoggedIn() = _NotLoggedIn;
  const factory AuthState.success() = _Success;
  const factory AuthState.error(String message) = _Error;
  const factory AuthState.loaded(AuhtenticatedUser user) = _Loaded;
}
