import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/utils/enums/language_enum.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

/// load date from disk and cache in memory as initial value passing
/// to some providers, avoid introducing AsyncValue.
class Cache {
  Cache._internal();

  static final Cache instance = Cache._internal();

  User? user;
  late String language;
  late Color themeColor;
  String? lastVersion;
  late String currentVersion;

  Future<void> loadAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion = packageInfo.version;
  }

  AppInstallStatus get appInstallStatus {
    if (lastVersion == null) {
      return AppInstallStatus.newInstall;
    } else {
      Version curVersion = Version.parse(currentVersion);
      Version latestVersion = Version.parse(lastVersion!);
      if (latestVersion == curVersion) {
        return AppInstallStatus.normal;
      } else if (latestVersion < curVersion) {
        return AppInstallStatus.upgrade;
      } else {
        return AppInstallStatus.downgrade;
      }
    }
  }
}
