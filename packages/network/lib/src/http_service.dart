import 'response.dart' as response;

abstract class HttpService {
  /// Http base url
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<response.Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  });

  Future<response.Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
