import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/account.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';

abstract class AuthRepo {

  ResultFuture<Account> getUser();

  ResultFuture<User> login({required String username, required String password});

  ResultFuture<User> register(
      {required String username,
        required String password,
        required String repassword});

  ResultFuture<void> logout();
}