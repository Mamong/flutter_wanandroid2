import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/article/domain/repos/article_repo.dart';

class GetSearchArticles
    extends UsecaseWithParamsExp<PaginatedResp, GetSearchArticlesParams> {
  const GetSearchArticles(this._repo);

  final ArticleRepo _repo;

  @override
  Future<PaginatedResp<Article>> call(GetSearchArticlesParams params) =>
      _repo.getSearchArticleList(page: params.page, pageSize: params.pageSize, k: params.k);
}

class GetSearchArticlesParams extends PaginatedParams {
  const GetSearchArticlesParams(
      {required int page, required int pageSize, required this.k})
      : super(page: page, pageSize: pageSize);

  final String k;

  @override
  List<Object?> get props => [page, pageSize, k];
}