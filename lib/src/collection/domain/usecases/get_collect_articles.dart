import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/collection/domain/repos/collection_repo.dart';

class GetCollectArticles
    extends UsecaseWithParams<PaginatedResp, PaginatedParams> {
  const GetCollectArticles(this._repo);

  final CollectionRepo _repo;

  @override
  ResultFuture<PaginatedResp<Article>> call(PaginatedParams params) =>
      _repo.getCollectArticles(page: params.page, pageSize: params.pageSize);
}
