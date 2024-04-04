import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:key_value_storage/key_value_storage.dart';

import '../configs.dart';
import 'dio_cache_response.dart';
import 'dio_util.dart';

class DioCacheInterceptors extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CachedResponse>();

  /// Creates new instance of [CacheInterceptor]
  DioCacheInterceptors(this.storageService);

  /// Storage service used to store cache in local storage
  final StorageService storageService;

  /// Helper method to create a storage key from
  /// request/response information
  ///
  /// e.g. for a GET request to /person/popular endpoint:
  /// storage key: 'GET:https://api.themoviedb.org/3/person/popular/'
  //@visibleForTesting
  String createStorageKey(RequestOptions options) {
    if(options.extra["cacheKey"]) return options.extra["cacheKey"];

    String method = options.method;
    String baseUrl = options.baseUrl;
    String path = options.path;
    Map<String, dynamic> queryParameters = options.queryParameters;

    var storageKey = '${method.toUpperCase()}:${baseUrl + path}/';
    if (queryParameters.isNotEmpty) {
      storageKey += '?';
      queryParameters.forEach((key, dynamic value) {
        storageKey += '$key=$value&';
      });
    }
    return storageKey;
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!DioUtil.CACHE_ENABLE ||
        options.extra["noCache"] == true ||
        options.method.toLowerCase() != 'get') {
      return handler.next(options);
    }

    // 是否刷新缓存
    bool refresh = options.extra[Configs.dioCacheForceRefreshKey] == true;
    final storageKey = createStorageKey(options);

    if (refresh) {
      // 删除本地缓存
      deleteAll(storageKey);
      return handler.next(options);
    }

    var ob = _getMemoryResponse(storageKey);
    if (ob != null) {
      // 内存缓存
      return handler.resolve(ob.buildResponse(options));
    } else {
      // 磁盘缓存
      if (await storageService.has(storageKey)) {
        final cachedResponse = _getDiskResponse(storageKey);
        if (cachedResponse != null) {
          log('📦 📦 📦 Retrieved response from cache');
          final response = cachedResponse.buildResponse(options);
          log('⬅️ ⬅️ ⬅️ Response');
          // ignore: lines_longer_than_80_chars
          log('<---- ${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}');
          log('Query params: ${response.requestOptions.queryParameters}');
          log('-------------------------');
          return handler.resolve(response);
        }
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //不缓存的情况去掉
    RequestOptions options = response.requestOptions;
    if (!DioUtil.CACHE_ENABLE ||
        options.extra["noCache"] == true ||
        options.method.toLowerCase() != "get") {
      return handler.next(response);
    }

    final storageKey = createStorageKey(response.requestOptions);

    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      log('🌍 🌍 🌍 Retrieved response from network');
      log('⬅️ ⬅️ ⬅️ Response');
      // ignore: lines_longer_than_80_chars
      log('<---- ${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}');
      log('Query params: ${response.requestOptions.queryParameters}');
      log('-------------------------');

      final cachedResponse = CachedResponse(
        data: response.data,
        headers: Headers.fromMap(response.headers.map),
        age: clock.now(),
        statusCode: response.statusCode!,
      );
      _saveCache(storageKey, cachedResponse);
      storageService.set(storageKey, cachedResponse.toJson());
    }
    return handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    //不缓存的情况去掉
    RequestOptions options = err.requestOptions;
    if (!DioUtil.CACHE_ENABLE ||
        options.extra["noCache"] == true ||
        options.method.toLowerCase() != "get") {
      return handler.next(err);
    }

    final storageKey = createStorageKey(err.requestOptions);

    var ob = _getMemoryResponse(storageKey);
    if (ob != null) {
      // 内存缓存
      return handler.resolve(ob.buildResponse(options));
    } else {
      // 磁盘缓存
      if (await storageService.has(storageKey)) {
        final cachedResponse = _getDiskResponse(storageKey);
        if (cachedResponse != null) {
          log('📦 📦 📦 Retrieved response from cache');
          final response = cachedResponse.buildResponse(options);
          log('⬅️ ⬅️ ⬅️ Response');
          // ignore: lines_longer_than_80_chars
          log('<---- ${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}');
          log('Query params: ${response.requestOptions.queryParameters}');
          log('-------------------------');
          return handler.resolve(response);
        }
      }
    }
    return handler.next(err);
  }

  _saveCache(String key, CachedResponse object) {
    // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
    if (cache.length == Configs.maxMemoryCacheCount) {
      cache.remove(cache[cache.keys.first]);
    }
    cache[key] = object;
  }

  void deleteAll(String key) {
    cache.remove(key);
    storageService.remove(key);
  }

  CachedResponse? _getMemoryResponse(String key){
    var ob = cache[key];
    if (ob != null) {
      // 内存缓存
      if ((ob.isMemoryValid)) {
        return ob;
      } else {
        //若已过期则删除缓存
        cache.remove(key);
      }
    }
    return null;
  }

  CachedResponse? _getDiskResponse(String storageKey) {
    final dynamic rawCachedResponse = storageService.get(storageKey);
    try {
      final cachedResponse = CachedResponse.fromJson(
        json.decode(json.encode(rawCachedResponse)) as Map<String, dynamic>,
      );
      if (cachedResponse.isDiskValid) {
        return cachedResponse;
      } else {
        log('Cache is outdated, deleting it...');
        storageService.remove(storageKey);
        return null;
      }
    } catch (e) {
      log('Error retrieving response from cache');
      log('e: $e');
      return null;
    }
  }
}
