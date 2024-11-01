part of 'ad_cubit.dart';

@freezed
class AdState with _$AdState {
  const factory AdState.initial() = _Initial;
  const factory AdState.loading() = _Loading;
  const factory AdState.loaded(Ad ad) = _Loadded;
  const factory AdState.error() = _Error;
}
