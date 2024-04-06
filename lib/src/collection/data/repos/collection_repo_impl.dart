import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/article/data/models/article_model.dart';
import 'package:flutter_wanandroid2/src/article/data/models/paginated_resp_model.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/collection/data/datasources/collection_remote_data_src.dart';
import 'package:flutter_wanandroid2/src/collection/domain/repos/collection_repo.dart';

class CollectionRepoImpl with ResultExt implements CollectionRepo {
  const CollectionRepoImpl(this._remoteDataSource);

  final CollectionRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<void> collectArticle(int id) async {
    return await guard(() async {
      return await _remoteDataSource.collectArticle(id);
    });
  }

  @override
  ResultFuture<void> uncollectArticle(int id) {
    return guard(() {
      return _remoteDataSource.uncollectArticle(id);
    });
  }

  @override
  ResultFuture<PaginatedResp<Article>> getCollectArticles(
      {int page = 0, int pageSize = 10, bool forceRefresh = true}) async {
    return await guard(() async {
      final result = await _remoteDataSource.getCollectArticles(
          page: page, pageSize: pageSize);
      return result
          .toDomainModel<Article, ArticleModel>((e) => e.toDomainModel());
    });
  }

  @override
  ResultFuture<void> uncollectMyArticle(
      {required int id, required int originId}) {
    return guard(() {
      return _remoteDataSource.uncollectMyArticle(id, originId);
    });
  }
}
