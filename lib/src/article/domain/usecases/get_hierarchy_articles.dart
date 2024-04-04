import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/article/domain/repos/article_repo.dart';

class GetHierarchyArticles
    extends UsecaseWithParamsExp<PaginatedResp, GetHierarchyArticlesParams> {
  const GetHierarchyArticles(this._repo);

  final ArticleRepo _repo;

  @override
  Future<PaginatedResp<Article>> call(GetHierarchyArticlesParams params) =>
      _repo.getHierarchyArticleList(
          page: params.page, pageSize: params.pageSize, cid: params.cid);
}

class GetHierarchyArticlesParams extends PaginatedParams {
  const GetHierarchyArticlesParams(
      {required int page, required int pageSize, required this.cid})
      : super(page: page, pageSize: pageSize);

  final int cid;

  @override
  List<Object?> get props => [page, pageSize, cid];
}
