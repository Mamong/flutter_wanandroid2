import 'package:dio/dio.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'configs.dart';
import 'dio/dio_cache_interceptors.dart';
import 'dio/dio_token_interceptors.dart';
import 'http_service.dart';
import 'dio_result_handler_mixin.dart';
import 'response.dart' as response;

class DioNetworkService extends HttpService with ResultHandlerMixin {
  DioNetworkService(
    StorageService storageService, {
    Dio? dioOverride,
    bool enableCaching = true,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
    if (enableCaching) {
      dio.interceptors.add(DioCacheInterceptors(storageService));
    }
    dio.interceptors.add(DioTokenInterceptors(storageService));
  }

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => Configs.apiBaseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/x-www-form-urlencoded',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }

  @override
  Future<response.Response> post(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<response.Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = true,
  }) {
    dio.options.extra[Configs.dioCacheForceRefreshKey] = forceRefresh;
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
