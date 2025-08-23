part of 'public_profiles_cubit.dart';

@freezed
class PublicProfilesState with _$PublicProfilesState {
  const factory PublicProfilesState.initial() = _Initial;
  const factory PublicProfilesState.loading() = _Loading;
  const factory PublicProfilesState.loaded(PublicProfile publicProfile) =
      _Loaded;
  const factory PublicProfilesState.error(String message) = _Error;
}
