import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';

/// load date from disk and cache in memory as initial value passing
/// to some providers, avoid introducing AsyncValue.
class Cache {
  Cache._internal();

  static final Cache instance = Cache._internal();

  User? user;

  late String language;

  late Color themeColor;
}
