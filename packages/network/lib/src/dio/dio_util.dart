import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:dio_http2_adapter/dio_http2_adapter.dart';

// import 'dio_cache_interceptors.dart';
// import 'dio_interceptors.dart';
// import 'dio_log_interceptors.dart';
import '../http_method.dart';
// import 'dio_token_interceptors.dart';
import 'dio_transformer.dart';

class DioUtil {
  /// 请求的URL前缀
  static String baseURL = "http://localhost:8080";

  /// 连接超时时间
  static const int connectTimeout = 6;

  /// 响应超时时间
  static const int receiveTimeout = 6;

  /// 是否开启网络缓存,默认false
  static bool cacheEnable = false;

  /// 最大缓存时间(按秒), 默认缓存七天,可自行调节
  static int maxCacheAge = 7 * 24 * 60 * 60;


  static Dio _dio = Dio();
  Dio get dio => _dio;

  DioUtil._();

  factory DioUtil() => _singleton;
  static final DioUtil _singleton = DioUtil._();
  static DioUtil get instance => DioUtil();

  /// 取消请求token
  final CancelToken _cancelToken = CancelToken();

  /// cookie
  CookieJar cookieJar = CookieJar();

  Dio configDio(
      {required String baseUrl,
      int connectTimeout = connectTimeout,
      int receiveTimeout = receiveTimeout}) {
    /// 初始化基本选项
    BaseOptions options = BaseOptions(
        baseUrl: baseURL,
        connectTimeout: Duration(seconds: connectTimeout),
        receiveTimeout: Duration(seconds: receiveTimeout));

    /// 初始化dio
    _dio = Dio(options);
    // _dio.httpClientAdapter = Http2Adapter(
    //   ConnectionManager(idleTimeout: Duration(seconds: CONNECT_TIMEOUT)),
    // );
    initAdapter();

    /// 添加拦截器
    //_dio.interceptors.add(DioInterceptors());

    /// 添加转换器
    _dio.transformer = DioTransformer();

    /// 添加cookie管理器
    _dio.interceptors.add(CookieManager(cookieJar));

    /// 刷新token拦截器(lock/unlock)
    //_dio.interceptors.add(DioTokenInterceptors());

    /// 添加缓存拦截器
    //_dio.interceptors.add(DioCacheInterceptors());
    return _dio;
  }

  void initAdapter({String? proxyAddress, String? pem}) {
    dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
      // Don't trust any certificate just because their root cert is trusted.
      final HttpClient client =
          HttpClient(context: SecurityContext(withTrustedRoots: false));
      if (proxyAddress != null) {
        client.findProxy = (uri) {
          // Forward all request to proxy "localhost:8888".
          // Be aware, the proxy should went through you running device,
          // not the host platform.
          return proxyAddress;
        };
      }
      // You can test the intermediate / root cert here. We just ignore it.
      if (pem != null) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == pem) {
            // 验证证书
            return true;
          }
          return false;
        };
      }
      return client;
    });
  }

  /// 开启日志打印
  void openLog() {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    //_dio.interceptors.add(LoggingInterceptor());
  }

  /// 请求类
  Future<T> request<T>(
    String path, {
    HTTPMethod method = HTTPMethod.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const methodValues = {
      HTTPMethod.get: 'get',
      HTTPMethod.post: 'post',
      HTTPMethod.put: 'put',
      HTTPMethod.delete: 'delete',
      HTTPMethod.patch: 'patch',
      HTTPMethod.head: 'head'
    };

    options ??= Options(method: methodValues[method]);
    try {
      Response response;
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken ?? _cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  /// 取消网络请求
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }
}
