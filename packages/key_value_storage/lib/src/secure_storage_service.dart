import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_service.dart';

class SecureStorageService implements StorageService {
  FlutterSecureStorage? secureStorage;

  // final Completer<FlutterSecureStorage> initCompleter =
  // Completer<FlutterSecureStorage>();

  @override
  FutureOr<void> init() {
    //initCompleter.complete(const FlutterSecureStorage());
    secureStorage = const FlutterSecureStorage();
  }

  @override
  bool get hasInitialized => secureStorage != null;

  @override
  Future<String?> get(String key) async {
    //secureStorage = await initCompleter.future;
    return secureStorage!.read(key: key);
  }

  @override
  Future<void> clear() async {
    //secureStorage = await initCompleter.future;
    await secureStorage!.deleteAll();
  }

  @override
  Future<bool> has(String key) async {
    //secureStorage = await initCompleter.future;
    return secureStorage!.containsKey(key:key);
  }

  @override
  Future<void> remove(String key) async {
    //secureStorage = await initCompleter.future;
    await secureStorage!.delete(key: key);
  }

  @override
  Future<void> set(String key, data) async {
    //secureStorage = await initCompleter.future;
    await secureStorage!.write(key: key, value:data.toString());
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}