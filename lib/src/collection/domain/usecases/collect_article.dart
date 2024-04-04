import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/collection/domain/repos/collection_repo.dart';

class CollectArticle extends UsecaseWithParams<void, int> {
  const CollectArticle(this._repo);

  final CollectionRepo _repo;

  @override
  ResultFuture call(int params) => _repo.collectArticle(params);
}
