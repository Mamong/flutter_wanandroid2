import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/article/domain/repos/article_repo.dart';

class GetArticles extends UsecaseWithParamsExp<PaginatedResp, PaginatedParams> {
  const GetArticles(this._repo);

  final ArticleRepo _repo;

  @override
  Future<PaginatedResp<Article>> call(PaginatedParams params) => _repo
      .getArticleList(page: params.page, pageSize: params.pageSize);
}
