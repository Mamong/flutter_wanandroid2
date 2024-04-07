import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'http_exception.dart';
import 'http_service.dart';
import 'response.dart' as response;

/// 对于业务数据进行转换
/// 对异常情况进行适配
mixin ResultHandlerMixin on HttpService {
  Future<response.Response> handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();
      if (res.data is String) {
        return response.Response(
          errorCode: 200,
          errorMsg: "ok",
          data: null,
        );
      }
      Map<String, dynamic> obj = res.data;
      int errorCode = obj["errorCode"];
      if (errorCode == 0) {
        return response.Response(
          errorCode: obj["errorCode"],
          errorMsg: obj["errorMsg"],
          data: obj["data"],
        );
      } else {
        throw ServerException(
          message: obj["errorMsg"],
          statusCode: obj["errorCode"] == -1001
              ? ErrorType.notLogin
              : ErrorType.businessFailed,
          identifier: endpoint,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      String message = '';
      String identifier = '';
      ErrorType statusCode = ErrorType.none;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        // case SocketException:
        //   e as SocketException;
        //   message = 'Unable to connect to the server.';
        //   statusCode = ErrorType.socket;
        //   identifier = 'Socket Exception ${e.message}\n at  $endpoint';
        //   break;

        case DioException:
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';
          statusCode = ErrorType.httpException;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Unknown error occurred';
          statusCode = ErrorType.unknown;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }

      throw ServerException(
        message: message,
        statusCode: statusCode,
        identifier: identifier,
      );
    }
  }
}
