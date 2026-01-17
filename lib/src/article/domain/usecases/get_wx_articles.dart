import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/article/domain/repos/article_repo.dart';

class GetWxArticles
    extends UsecaseWithParamsExp<PaginatedResp, GetWxArticlesParams> {
  const GetWxArticles(this._repo);

  final ArticleRepo _repo;

  @override
  Future<PaginatedResp<Article>> call(GetWxArticlesParams params) =>
      _repo.getWxArticleList(
          page: params.page, pageSize: params.pageSize, id: params.id);
}

class GetWxArticlesParams extends PaginatedParams {
  const GetWxArticlesParams(
      {required super.page, required super.pageSize, required this.id});

  final int id;

  @override
  List<Object?> get props => [page, pageSize, id];
}
