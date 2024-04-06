import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/article/data/datasources/article_remote_data_src.dart';
import 'package:flutter_wanandroid2/src/article/data/models/article_model.dart';
import 'package:flutter_wanandroid2/src/article/features/search/data/models/hotkey_model.dart';
import 'package:flutter_wanandroid2/src/article/data/models/paginated_resp_model.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/features/search/domain/entities/hotkey.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/article/domain/repos/article_repo.dart';

class ArticleRepoImpl with ResultExt implements ArticleRepo {
  const ArticleRepoImpl(this._remoteDataSource);

  final ArticleRemoteDataSrc _remoteDataSource;

  @override
  Future<PaginatedResp<Article>> getArticleList(
      {int page = 0, int pageSize = 10}) async {
    // return await guard(() async {
    final result =
        await _remoteDataSource.getArticleList(page: page, pageSize: pageSize);
    return result
        .toDomainModel<Article, ArticleModel>((e) => e.toDomainModel());
    // });
  }

  @override
  Future<List<Article>> getTopList({bool forceRefresh = true}) async {
    // return await guard<List<Article>>(() async {
    final result = await _remoteDataSource.getTopList();
    return result.map((e) => e.toDomainModel(isTop: true)).toList();
    // });
  }

  @override
  Future<List<Hotkey>> getHotkeys() async {
    final result = await _remoteDataSource.getHotkeys();
    return result.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<PaginatedResp<Article>> getHierarchyArticleList(
      {int page = 0, int pageSize = 10, required int cid}) async {
    final result = await _remoteDataSource.getHierarchyArticleList(
        page: page, pageSize: pageSize, cid: cid);
    return result
        .toDomainModel<Article, ArticleModel>((e) => e.toDomainModel());
  }

  @override
  Future<PaginatedResp<Article>> getProjectArticleList(
      {int page = 0, int pageSize = 10, required int cid}) async {
    final result = await _remoteDataSource.getProjectArticleList(
        page: page, pageSize: pageSize, cid: cid);
    return result
        .toDomainModel<Article, ArticleModel>((e) => e.toDomainModel());
  }

  @override
  Future<PaginatedResp<Article>> getSearchArticleList(
      {int page = 0, int pageSize = 10, required String k}) async {
    final result = await _remoteDataSource.getSearchArticleList(
        page: page, pageSize: pageSize, k: k);
    return result
        .toDomainModel<Article, ArticleModel>((e) => e.toDomainModel());
  }

  @override
  Future<PaginatedResp<Article>> getWxArticleList(
      {int page = 0, int pageSize = 10, required int id}) async {
    final result = await _remoteDataSource.getWxArticleList(
        page: page, pageSize: pageSize, id: id);
    return result
        .toDomainModel<Article, ArticleModel>((e) => e.toDomainModel());
  }
}
