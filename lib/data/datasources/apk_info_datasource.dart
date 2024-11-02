import 'package:tu_bolitero/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:tu_bolitero/domain/models/apk_info.dart';

class ApkInfoDatasource {
  final _client = Dio();

  Future<ApkInfo> getApkInfo() async {
    final response = await _client.get('$host/api/apk');
    final data = response.data as List;
    final apkInfo = ApkInfo.fromJson(data[0]);
    return apkInfo;
  }
}

final apkInfoDatasource = ApkInfoDatasource();
