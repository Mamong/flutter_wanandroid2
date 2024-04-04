import 'package:flutter_wanandroid2/src/auth/data/model/account_model.dart';
import 'package:flutter_wanandroid2/src/auth/data/model/user_model.dart';
import 'package:network/network.dart';

abstract class AuthRemoteDataSrc {
  Future<AccountModel> getUser();

  Future<UserModel> login({required String username, required String password});

  Future<UserModel> register(
      {required String username,
      required String password,
      required String repassword});

  Future<void> logout();
}

class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc {
  AuthRemoteDataSrcImpl(this._httpService);

  final HttpService _httpService;

  @override
  Future<AccountModel> getUser() async{
    final responseData = await _httpService.get('/user/lg/userinfo/json');
    return AccountModel.fromJson(responseData.data);
  }

  @override
  Future<UserModel> login(
      {required String username, required String password}) async {
    final responseData = await _httpService.post('/user/login',
        data: {"username": username, "password": password});
    return UserModel.fromJson(responseData.data);
  }

  @override
  Future<UserModel> register(
      {required String username,
      required String password,
      required String repassword}) async {
    final responseData = await _httpService.post('/user/register', data: {
      "username": username,
      "password": password,
      "repassword": repassword
    });
    return UserModel.fromJson(responseData.data);
  }

  @override
  Future<void> logout() async {
    await _httpService.get('/user/logout');
  }
}
