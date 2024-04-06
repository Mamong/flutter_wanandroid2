import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/repos/article_repo.dart';

class GetHotkeys extends UsecaseWithoutParamsExp {
  const GetHotkeys(this._repo);

  final ArticleRepo _repo;

  @override
  Future call() => _repo.getHotkeys();
}
