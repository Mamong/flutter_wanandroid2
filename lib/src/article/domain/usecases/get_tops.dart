import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/repos/article_repo.dart';

class GetTops extends UsecaseWithoutParamsExp {
  const GetTops(this._repo);

  final ArticleRepo _repo;

  @override
  Future call() => _repo.getTopList();
}