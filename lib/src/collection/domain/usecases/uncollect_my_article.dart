import 'package:equatable/equatable.dart';
import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/collection/domain/repos/collection_repo.dart';

class UncollectMyArticle extends UsecaseWithParams<void, UncollectMyArticleParams> {
  const UncollectMyArticle(this._repo);

  final CollectionRepo _repo;

  @override
  ResultFuture call(UncollectMyArticleParams params) =>
      _repo.uncollectMyArticle(id: params.id, originId: params.originId);
}

class UncollectMyArticleParams extends Equatable {
  const UncollectMyArticleParams({required this.id, required this.originId});
  final int id;
  final int originId;

  @override
  List<Object?> get props => [id, originId];
}
