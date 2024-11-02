import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/data/datasources/apk_info_datasource.dart';
import 'package:tu_bolitero/domain/models/apk_info.dart';

part 'apk_info_state.dart';
part 'apk_info_cubit.freezed.dart';

class ApkInfoCubit extends Cubit<ApkInfoState> {
  ApkInfoCubit() : super(const ApkInfoState.initial());

  void checkVersion() async {
    final apkInfo = await apkInfoDatasource.getApkInfo();

    final newVersion = apkInfo.apkVersion;

    final newSplittedVersion = newVersion.split('.');
    final currentSplittedVersion = currentApkVersion.split('.');

    for (var i = 0; i < newSplittedVersion.length; i++) {
      final newVersionValue = int.parse(newSplittedVersion[i]);
      final currentVersionValue = int.parse(currentSplittedVersion[i]);

      if (newVersionValue == currentVersionValue) {
        continue;
      }
      if (newVersionValue > currentVersionValue) {
        emit(ApkInfoState.newVersion(apkInfo));
        break;
      }
    }
  }
}
