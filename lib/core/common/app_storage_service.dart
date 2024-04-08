import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_wanandroid2/core/common/singletons/cache.dart';
import 'package:flutter_wanandroid2/core/utils/enums/language_enum.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';

//save some settings and userInfo in storage
class AppStorageService {
  AppStorageService(this.storageService);

  late final StorageService storageService;

  Future<String> getTheme() async {
    String? theme = await storageService.get(APP_THEME_STORAGE_KEY) as String?;

    // First time loading.
    // Set 'light' mode as the default.
    if (theme == null) {
      theme = ThemeMode.light.name;
      storageService.set(APP_THEME_STORAGE_KEY, theme);
    }
    return theme;
  }

  Future<void> setTheme(String mode) async {
    await storageService.set(APP_THEME_STORAGE_KEY, mode);
  }

  Future<int> getThemeColor() async {
    int? themeColor =
        await storageService.get(APP_THEME_COLOR_STORAGE_KEY) as int?;

    if (themeColor == null) {
      themeColor = 0xFF2196F3;
      storageService.set(APP_THEME_COLOR_STORAGE_KEY, themeColor);
    }
    Cache.instance.themeColor = Color(themeColor);
    return themeColor;
  }

  Future<void> setThemeColor(int color) async {
    await storageService.set(APP_THEME_COLOR_STORAGE_KEY, color);
  }

  Future<String> getLanguage() async {
    String? language =
        await storageService.get(APP_LANGUAGE_STORAGE_KEY) as String?;

    if (language == null) {
      language = Language.zhCN.code;
      storageService.set(APP_LANGUAGE_STORAGE_KEY, language);
    }
    Cache.instance.language = language;
    return language;
  }

  Future<void> setLanguage(String language) async {
    await storageService.set(APP_LANGUAGE_STORAGE_KEY, language);
  }

  Future<String?> getToken() async {
    return await storageService.get(APP_TOKEN_STORAGE_KEY) as String?;
  }

  Future<void> setToken(String token) async {
    await storageService.set(APP_TOKEN_STORAGE_KEY, token);
  }

  Future<User?> getUserInfo() async {
    final json = await storageService.get(APP_USERINFO_STORAGE_KEY) as String?;
    if (json != null) {
      final user = User.fromJson(jsonDecode(json));
      Cache.instance.user = user;
      return user;
    } else {
      return null;
    }
  }

  Future<void> setUserInfo(User userInfo) async {
    await storageService.set(
        APP_USERINFO_STORAGE_KEY, jsonEncode(userInfo.toJson()));
  }

  Future<void> clearUserInfo() async {
    await storageService.remove(APP_USERINFO_STORAGE_KEY);
  }

  Future<String?> getLastInstallVersion() async {
    final version = await storageService.get(APP_LAST_INSTALL_VERSION_KEY);
    Cache.instance.lastVersion = version;
    return version;
  }

  Future<void> cacheVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    // String buildNumber = packageInfo.buildNumber;
    await storageService.set(APP_LAST_INSTALL_VERSION_KEY, version);
  }
}

const APP_THEME_STORAGE_KEY = "APP_THEME_STORAGE_KEY";
const APP_THEME_COLOR_STORAGE_KEY = "APP_THEME_COLOR_STORAGE_KEY";
const APP_LANGUAGE_STORAGE_KEY = "APP_LANGUAGE_STORAGE_KEY";
const APP_USERINFO_STORAGE_KEY = "APP_USERINFO_STORAGE_KEY";
const APP_TOKEN_STORAGE_KEY = "APP_TOKEN_STORAGE_KEY";
const APP_LAST_INSTALL_VERSION_KEY = 'APP_LAST_INSTALL_VERSION_KEY';
