import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/utils/enums/language_enum.dart';
import 'package:key_value_storage/key_value_storage.dart';

import '../../src/auth/domain/entities/user.dart';

// final appServiceProvider =
//     Provider<AppStorageService>((ref) => AppStorageService(ref));

//save some settings and userInfo in storage
class AppStorageService {
  AppStorageService(this.storageService);

  late final StorageService  storageService;

  Future<String> getTheme() async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
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
    // final storageService = ref.read(storageServiceProvider).requireValue;
    await storageService.set(APP_THEME_STORAGE_KEY, mode);
  }

  Future<int> getThemeColor() async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    int? themeColor =
        await storageService.get(APP_THEME_COLOR_STORAGE_KEY) as int?;

    if (themeColor == null) {
      themeColor = 0xFF2196F3;
      storageService.set(APP_THEME_COLOR_STORAGE_KEY, themeColor);
    }
    return themeColor;
  }

  Future<void> setThemeColor(int color) async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    await storageService.set(APP_THEME_COLOR_STORAGE_KEY, color);
  }

  Future<String> getLanguage() async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    String? language =
        await storageService.get(APP_LANGUAGE_STORAGE_KEY) as String?;

    if (language == null) {
      language = Language.zhCN.code;
      storageService.set(APP_LANGUAGE_STORAGE_KEY, language);
    }
    return language;
  }

  Future<void> setLanguage(String language) async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    await storageService.set(APP_LANGUAGE_STORAGE_KEY, language);
  }

  Future<String?> getToken() async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    return await storageService.get(APP_TOKEN_STORAGE_KEY) as String?;
  }

  Future<void> setToken(String token) async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    await storageService.set(APP_TOKEN_STORAGE_KEY, token);
  }

  Future<User?> getUserInfo() async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    final json = await storageService.get(APP_USERINFO_STORAGE_KEY) as String?;
    if (json != null) {
      return User.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }

  Future<void> setUserInfo(User userInfo) async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    await storageService.set(
        APP_USERINFO_STORAGE_KEY, jsonEncode(userInfo.toJson()));
  }

  Future<void> clearUserInfo() async {
    // final storageService = ref.read(storageServiceProvider).requireValue;
    await storageService.remove(APP_USERINFO_STORAGE_KEY);
  }
}

const APP_THEME_STORAGE_KEY = "APP_THEME_STORAGE_KEY";
const APP_THEME_COLOR_STORAGE_KEY = "APP_THEME_COLOR_STORAGE_KEY";
const APP_LANGUAGE_STORAGE_KEY = "APP_LANGUAGE_STORAGE_KEY";
const APP_USERINFO_STORAGE_KEY = "APP_USERINFO_STORAGE_KEY";
const APP_TOKEN_STORAGE_KEY = "APP_TOKEN_STORAGE_KEY";
