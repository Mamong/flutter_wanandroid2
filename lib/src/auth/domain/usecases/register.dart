import 'package:equatable/equatable.dart';
import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';
import 'package:flutter_wanandroid2/src/auth/domain/repos/auth_repo.dart';

class Register extends UsecaseWithParams<User, RegisterParams> {
  const Register(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<User> call(RegisterParams params) => _repo.register(
      username: params.username,
      password: params.password,
      repassword: params.repassword);
}

class RegisterParams extends Equatable {
  const RegisterParams(
      {required this.username,
      required this.password,
      required this.repassword});

  final String username;
  final String password;
  final String repassword;

  @override
  // TODO: implement props
  List<dynamic> get props => [username, password, repassword];
}
