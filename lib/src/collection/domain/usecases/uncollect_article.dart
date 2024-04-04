import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/collection/domain/repos/collection_repo.dart';

class UncollectArticle extends UsecaseWithParams<void, int> {
  const UncollectArticle(this._repo);

  final CollectionRepo _repo;

  @override
  ResultFuture call(int params) => _repo.uncollectArticle(params);
}