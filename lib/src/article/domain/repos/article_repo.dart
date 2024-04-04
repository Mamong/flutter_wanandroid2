import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';

abstract class ArticleRepo {
  Future<PaginatedResp<Article>> getArticleList(
      {int page, int pageSize});

  Future<List<Article>> getTopList();

  Future<PaginatedResp<Article>> getHierarchyArticleList(
      {int page, int pageSize, required int cid});

  Future<PaginatedResp<Article>> getProjectArticleList(
      {int page, int pageSize, required int cid});

  Future<PaginatedResp<Article>> getSearchArticleList(
      {int page, int pageSize, required String k});

  Future<PaginatedResp<Article>> getWxArticleList(
      {int page, int pageSize, required int id});
}