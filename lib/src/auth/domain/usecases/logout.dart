import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/auth/domain/repos/auth_repo.dart';

class Logout extends UsecaseWithoutParams {
  const Logout(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call() => _repo.logout();
}
