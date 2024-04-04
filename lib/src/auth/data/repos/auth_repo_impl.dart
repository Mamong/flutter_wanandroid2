import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/auth/data/datasources/auth_remote_data_src.dart';
import 'package:flutter_wanandroid2/src/auth/data/model/account_model.dart';
import 'package:flutter_wanandroid2/src/auth/data/model/user_model.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/account.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';
import 'package:flutter_wanandroid2/src/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl with ResultExt implements AuthRepo {
  const AuthRepoImpl(this._remoteDataSource);

  final AuthRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<Account> getUser() async {
    return await guard<Account>(() async {
      final result = await _remoteDataSource.getUser();
      return result.toDomainModel();
    });
  }

  @override
  ResultFuture<User> login(
      {required String username, required String password}) async {
    return await guard<User>(() async {
      final result =
          await _remoteDataSource.login(username: username, password: password);
      return result.toDomainModel();
    });
  }

  @override
  ResultFuture<void> logout() async {
    return await guard<void>(() async {
      return await _remoteDataSource.logout();
    });
  }

  @override
  ResultFuture<User> register(
      {required String username,
      required String password,
      required String repassword}) async {
    return await guard<User>(() async {
      final result = await _remoteDataSource.register(
          username: username, password: password, repassword: repassword);
      return result.toDomainModel();
    });
  }
}
