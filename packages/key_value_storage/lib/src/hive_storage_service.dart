import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

import '../key_value_storage.dart';

/// [StorageService] interface implementation using the Hive package
///
/// See: https://pub.dev/packages/hive_flutter
class HiveStorageService implements StorageService {
  /// A Hive Box
  Box<dynamic>? hiveBox;

  // final Completer<Box> initCompleter =
  // Completer<Box>();

  @override
  bool get hasInitialized => hiveBox != null;

  @override
  Future<void> init() async{
    //initCompleter.complete(openBox());
    hiveBox = await openBox();
  }

  /// Opens a Hive box by its name
  Future<Box> openBox([String boxName = 'My_APP']) async {
    return await Hive.openBox<dynamic>(boxName);
  }

  @override
  Future<void> remove(String key) async {
    // hiveBox = await initCompleter.future;
    await hiveBox?.delete(key);
  }

  @override
  dynamic get(String key) async{
    // hiveBox = await initCompleter.future;
    return hiveBox?.get(key);
  }

  @override
  dynamic getAll() async{
    // hiveBox = await initCompleter.future;
    return hiveBox?.values.toList();
  }

  @override
  Future<bool> has(String key) async{
    // hiveBox = await initCompleter.future;
    return hiveBox?.containsKey(key) ?? false;
  }

  @override
  Future<void> set(String? key, dynamic data) async {
    // hiveBox = await initCompleter.future;
    await hiveBox?.put(key, data);
  }

  @override
  Future<void> clear() async {
    // hiveBox = await initCompleter.future;
    await hiveBox?.clear();
  }

  @override
  Future<void> close() async {
    // hiveBox = await initCompleter.future;
    await hiveBox?.close();
  }
}