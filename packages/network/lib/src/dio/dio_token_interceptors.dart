import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:key_value_storage/key_value_storage.dart';

import '../configs.dart';

class DioTokenInterceptors extends Interceptor {
  DioTokenInterceptors(this.storageService);

  /// Storage service used to store cache in local storage
  final StorageService storageService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    if(!["/user/login","/user/register"].contains(options.path)){
      final token = await storageService.get(Configs.dioTokenKey);
      if(token != null){
        options.headers["cookie"] = jsonDecode(token);
      }
    }

    if (options.headers['refreshToken'] == null) {
      //需要重新登录
      // DioUtil.getInstance()?.dio.lock();
      // Dio _tokenDio = Dio();
      // _tokenDio..get("http://localhost:8080/getRefreshToken").then((d) {
      //   options.headers['refreshToken'] = d;
      //   handler.next(options);
      // }).catchError((error, stackTrace) {
      //   handler.reject(error, true);
      // }) .whenComplete(() {
      //   DioUtil.getInstance()?.dio.unlock();
      // }); // unlock the dio
    } else {

    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {

    if(["/user/login","/user/register"].contains(response.requestOptions.path) &&
        response.headers['set-cookie'] != null){
      String token = jsonEncode(response.headers["set-cookie"]);
      await storageService.set(Configs.dioTokenKey,token);
    }else if(["/user/logout"].contains(response.requestOptions.path)){
      await storageService.remove(Configs.dioTokenKey);
    }

    super.onResponse(response, handler);
  }

}