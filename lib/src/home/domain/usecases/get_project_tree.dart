import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:flutter_wanandroid2/src/home/domain/repos/home_repo.dart';

class GetProjectTree extends UsecaseWithoutParamsExp{

  const GetProjectTree(this._repo);

  final HomeRepo _repo;

  @override
  Future<List<Tree>> call() => _repo.getProjectTree();
}