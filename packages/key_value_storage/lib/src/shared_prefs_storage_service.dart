import 'dart:async';

import 'package:key_value_storage/src/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService implements StorageService {
  SharedPreferences? sharedPreferences;

  //final Completer<SharedPreferences> initCompleter = Completer<SharedPreferences>();

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    //initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  bool get hasInitialized => sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    //sharedPreferences = await initCompleter.future;
    return sharedPreferences!.get(key);
  }

  @override
  Future<void> clear() async {
    //sharedPreferences = await initCompleter.future;
    await sharedPreferences!.clear();
  }

  @override
  Future<bool> has(String key) async {
    //sharedPreferences = await initCompleter.future;
    return sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<void> remove(String key) async {
    //sharedPreferences = await initCompleter.future;
    await sharedPreferences!.remove(key);
  }

  @override
  Future<void> set(String key, dynamic data) async {
    //sharedPreferences = await initCompleter.future;
    if (data is int) {
      await sharedPreferences!.setInt(key, data);
    } else if (data is bool) {
      await sharedPreferences!.setBool(key, data);
    } else if (data is double) {
      await sharedPreferences!.setDouble(key, data);
    } else {
      await sharedPreferences!.setString(key, data.toString());
    }
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
