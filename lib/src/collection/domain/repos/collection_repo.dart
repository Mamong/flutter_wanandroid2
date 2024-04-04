import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';

abstract class CollectionRepo {
  Future<PaginatedResp<Article>> getCollectArticles(
      {int page, int pageSize});

  ResultFuture<void> collectArticle(int id);
  ResultFuture<void> uncollectArticle(int id);
  ResultFuture<void> uncollectMyArticle({required int id, required int originId});

}