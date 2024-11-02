import 'dart:convert';

class ApkInfo {
  final String apk;
  final String apkVersion;
  final String apkVersionChanges;

  ApkInfo({
    required this.apk,
    required this.apkVersion,
    required this.apkVersionChanges,
  });

  factory ApkInfo.fromRawJson(String str) => ApkInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApkInfo.fromJson(Map<String, dynamic> json) => ApkInfo(
        apk: json["apk"],
        apkVersion: json["apk_version"],
        apkVersionChanges: json["apk_version_changes"],
      );

  Map<String, dynamic> toJson() => {
        "apk": apk,
        "apk_version": apkVersion,
        "apk_version_changes": apkVersionChanges,
      };
}
