import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/common/paginated_controller.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/article/domain/usecases/get_articles.dart';
import 'package:flutter_wanandroid2/src/article/domain/usecases/get_hierarchy_articles.dart';
import 'package:flutter_wanandroid2/src/article/domain/usecases/get_project_articles.dart';
import 'package:flutter_wanandroid2/src/article/domain/usecases/get_search_articles.dart';
import 'package:flutter_wanandroid2/src/article/domain/usecases/get_tops.dart';
import 'package:flutter_wanandroid2/src/article/domain/usecases/get_wx_articles.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';

part 'article_state.dart';
part 'article_provider.g.dart';

@riverpod
class ArticleAdapter extends _$ArticleAdapter
    with PaginationController<Article> {
  late GetTops _getTops;
  late GetArticles _getArticles;

  late GetHierarchyArticles _getHierarchyArticles;
  late GetProjectArticles _getProjectArticles;
  late GetWxArticles _getWxArticles;
  late GetSearchArticles _getSearchArticles;

  late ArticleSource _source;
  late dynamic _ext;

  @override
  FutureOr<PaginatedResp<Article>> build(ArticleSource source,
      [dynamic ext, GlobalKey? familyKey]) async {
    _getTops = sl<GetTops>();
    _getArticles = sl<GetArticles>();

    _getHierarchyArticles = sl<GetHierarchyArticles>();
    _getProjectArticles = sl<GetProjectArticles>();
    _getWxArticles = sl<GetWxArticles>();
    _getSearchArticles = sl<GetSearchArticles>();

    _source = source;
    _ext = ext;

    return await loadData(firstPage(source.index >= 2 ? 1 : 0, 10));
  }

  @override
  Future<PaginatedResp<Article>> loadData(PaginatedParams query) async {
    switch (_source) {
      case ArticleSource.home:
      case ArticleSource.collection: //not implement
        if (query.page == 0) {
          final result = await Future.wait([_getTops(), _getArticles(query)]);
          final tops = result[0] as List<Article>;
          final listRes = result[1] as PaginatedResp<Article>;
          listRes.datas.insertAll(0, tops);
          return listRes;
        } else {
          return await _getArticles(query);
        }
      case ArticleSource.search:
        return await _getSearchArticles(query as GetSearchArticlesParams);
      case ArticleSource.hierarchy:
        return await _getHierarchyArticles(query as GetHierarchyArticlesParams);
      case ArticleSource.project:
        return await _getProjectArticles(query as GetProjectArticlesParams);
      case ArticleSource.wxarticle:
        return await _getWxArticles(query as GetWxArticlesParams);
    }
  }

  PaginatedParams firstPage(int page, int pageSize) {
    switch (_source) {
      case ArticleSource.search:
        //0
        return GetSearchArticlesParams(page: page, pageSize: pageSize, k: _ext);
      case ArticleSource.hierarchy:
        //1
        return GetHierarchyArticlesParams(
            page: page, pageSize: pageSize, cid: _ext);
      case ArticleSource.project:
        //1
        return GetProjectArticlesParams(
            page: page, pageSize: pageSize, cid: _ext);
      case ArticleSource.wxarticle:
        //1
        return GetWxArticlesParams(page: page, pageSize: pageSize, id: _ext);
      case ArticleSource.home:
      case ArticleSource.collection:
        //0
        return PaginatedParams(page: page, pageSize: pageSize);
    }
  }

  @override
  PaginatedParams nextPage(PaginatedResp<Article> current) {
    switch (_source) {
      case ArticleSource.search:
        return GetSearchArticlesParams(
            page: current.curPage + 1, pageSize: current.size, k: _ext);
      case ArticleSource.hierarchy:
        return GetHierarchyArticlesParams(
            page: current.curPage + 1, pageSize: current.size, cid: _ext);
      case ArticleSource.project:
        return GetProjectArticlesParams(
            page: current.curPage + 1, pageSize: current.size, cid: _ext);
      case ArticleSource.wxarticle:
        return GetWxArticlesParams(
            page: current.curPage + 1, pageSize: current.size, id: _ext);
      case ArticleSource.home:
      case ArticleSource.collection:
        return super.nextPage(current);
    }
  }
}
