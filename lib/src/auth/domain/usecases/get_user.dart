import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/account.dart';
import 'package:flutter_wanandroid2/src/auth/domain/repos/auth_repo.dart';

class GetUser extends UsecaseWithoutParams {
  const GetUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<Account> call() => _repo.getUser();
}
