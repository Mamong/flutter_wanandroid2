import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/banner.dart';
import 'package:flutter_wanandroid2/src/home/domain/repos/home_repo.dart';

class GetBanner extends UsecaseWithoutParamsExp{

  const GetBanner(this._repo);

  final HomeRepo _repo;

  @override
  Future<List<Banner>> call() => _repo.getBanner();
}