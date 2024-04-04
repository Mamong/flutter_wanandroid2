import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/collection/domain/usecases/collect_article.dart';
import 'package:flutter_wanandroid2/src/collection/domain/usecases/get_collect_articles.dart';
import 'package:flutter_wanandroid2/src/collection/domain/usecases/uncollect_article.dart';
import 'package:flutter_wanandroid2/src/collection/domain/usecases/uncollect_my_article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collection_provider.g.dart';
part 'collection_state.dart';

@riverpod
class Collection extends _$Collection {
  late CollectArticle _collectArticle;
  late GetCollectArticles _getCollectArticles;
  late UncollectArticle _uncollectArticle;
  late UncollectMyArticle _uncollectMyArticle;

  @override
  CollectionState build([GlobalKey? familyKey]) {
    _collectArticle = sl<CollectArticle>();
    _getCollectArticles = sl<GetCollectArticles>();
    _uncollectArticle = sl<UncollectArticle>();
    _uncollectMyArticle = sl<UncollectMyArticle>();
    return const CollectionInitial();
  }

  // Future<PaginatedResp<Article>> getCollectArticles(
  //     {int page, int pageSize});

  Future<void> collectArticle(int id) async {
    state = const AddingToCollection();
    final result = await _collectArticle(id);
    result.fold((failure) => state = CollectionError(failure.message),
        (_) => state = const AddedToCollection());
  }

  Future<void> uncollectArticle(int id) async {
    state = const RemovingFromCollection();
    final result = await _uncollectArticle(id);
    result.fold((failure) => state = CollectionError(failure.message),
        (_) => state = const RemovedFromCollection());
  }

  Future<void> uncollectMyArticle(
      {required int id, required int originId}) async {
    state = const RemovingFromCollection();
    final result = await _uncollectMyArticle(
        UncollectMyArticleParams(id: id, originId: originId));
    result.fold((failure) => state = CollectionError(failure.message),
        (_) => state = const RemovedFromCollection());
  }
}
