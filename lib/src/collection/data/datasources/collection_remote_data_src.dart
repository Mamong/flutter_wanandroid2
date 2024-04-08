import 'package:flutter_wanandroid2/src/collection/data/models/collection_model.dart';
import 'package:flutter_wanandroid2/src/article/data/models/paginated_resp_model.dart';
import 'package:network/network.dart';

abstract class CollectionRemoteDataSrc {
  /// index collect article
  Future<void> collectArticle(int id);

  /// index uncollect article
  Future<void> uncollectArticle(int id);

  /// my collection article list
  Future<PaginatedRespModel<CollectionModel>> getCollectArticles(
      {int page, int pageSize});

  /// uncollect article in my collection
  Future<void> uncollectMyArticle(int id, int originId);
}

class CollectionRemoteDataSrcImpl implements CollectionRemoteDataSrc {
  const CollectionRemoteDataSrcImpl(this._httpService);

  final HttpService _httpService;

  @override
  Future<void> collectArticle(int id) async {
    await _httpService.post('/lg/collect/$id/json', data: {"id": id});
  }

  @override
  Future<void> uncollectArticle(int id) async {
    await _httpService
        .post('/lg/uncollect_originId/$id/json', data: {"id": id});
  }

  @override
  Future<PaginatedRespModel<CollectionModel>> getCollectArticles(
      {int page = 0, int pageSize = 10}) async {
    final responseData = await _httpService.get('/lg/collect/list/$page/json',
        queryParameters: {"page_size": pageSize});
    return PaginatedRespModel<CollectionModel>.fromJson(
        responseData.data, CollectionModel.fromJsonModel);
  }

  @override
  Future<void> uncollectMyArticle(int id, int originId) async {
    await _httpService
        .post('/lg/uncollect/$id/json', data: {"originId": originId});
  }
}
