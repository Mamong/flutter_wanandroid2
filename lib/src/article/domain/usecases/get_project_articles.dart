import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/article/domain/repos/article_repo.dart';

class GetProjectArticles
    extends UsecaseWithParamsExp<PaginatedResp, GetProjectArticlesParams> {
  const GetProjectArticles(this._repo);

  final ArticleRepo _repo;

  @override
  Future<PaginatedResp<Article>> call(GetProjectArticlesParams params) =>
      _repo.getProjectArticleList(
          page: params.page, pageSize: params.pageSize, cid: params.cid);
}

class GetProjectArticlesParams extends PaginatedParams {
  const GetProjectArticlesParams(
      {required super.page, required super.pageSize, required this.cid});

  final int cid;

  @override
  List<Object?> get props => [page, pageSize, cid];
}
