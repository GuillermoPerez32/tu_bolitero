part of 'apk_info_cubit.dart';

@freezed
class ApkInfoState with _$ApkInfoState {
  const factory ApkInfoState.initial() = _Initial;
  const factory ApkInfoState.newVersion(ApkInfo apkInfo) = _NewVersion;
}
