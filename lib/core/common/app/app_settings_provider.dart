import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_wanandroid2/core/common/app_storage_service.dart';
import 'package:flutter_wanandroid2/core/common/singletons/cache.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';

part 'app_settings_state.dart';
part 'app_settings_provider.g.dart';

@Riverpod(keepAlive: true)
class AppSettings extends _$AppSettings {
  late AppStorageService _storageService;

  @override
  AppSettingsState build() {
    _storageService = sl<AppStorageService>();
    return AppSettingsState(
        language: Cache.instance.language,
        themeColor: Cache.instance.themeColor);
  }

  void setLanguage(String language) async {
    await _storageService.setLanguage(language);
    state = state.copyWith(language: language);
  }

  void setThemeColor(int themeColor) async {
    await _storageService.setThemeColor(themeColor);
    state = state.copyWith(themeColor: Color(themeColor));
  }
}
