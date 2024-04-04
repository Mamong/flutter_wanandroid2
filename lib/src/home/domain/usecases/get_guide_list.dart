import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/navi.dart';
import 'package:flutter_wanandroid2/src/home/domain/repos/home_repo.dart';

class GetGuideList extends UsecaseWithoutParamsExp{

  const GetGuideList(this._repo);

  final HomeRepo _repo;

  @override
  Future<List<Navi>> call() => _repo.getGuideList();
}