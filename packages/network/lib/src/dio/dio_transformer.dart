import 'dart:async';
import 'package:dio/dio.dart';

class DioTransformer extends BackgroundTransformer {

  @override
  Future<String> transformRequest(RequestOptions options) async {
    // 如果请求的数据接口是List<String>那我们直接抛出异常
    // 譬如说把post的字典data转为form data
    if (options.data is List<String>) {
      throw DioException(
        error: "你不能直接发送List数据到服务器",
        requestOptions: options,
      );
    } else {
      return super.transformRequest(options);
    }
  }

  @override
  Future transformResponse(RequestOptions options, ResponseBody responseBody) async {

    // 例如我们响应选项里面没有自定义某些头部数据,那我们就可以自行添加
    //options.extra['myHeader'] = 'abc';
    return super.transformResponse(options, responseBody);
  }
}