import 'package:flutter_wanandroid2/src/article/data/models/article_model.dart';
import 'package:flutter_wanandroid2/src/article/features/search/data/models/hotkey_model.dart';
import 'package:flutter_wanandroid2/src/article/data/models/paginated_resp_model.dart';
import 'package:network/network.dart';

abstract class ArticleRemoteDataSrc {
  /// 1.1 index article list
  Future<PaginatedRespModel<ArticleModel>> getArticleList(
      {int page, int pageSize});

  /// 1.4 hotkey
  Future<List<HotkeyModel>> getHotkeys();

  /// index top articles
  Future<List<ArticleModel>> getTopList();

  /// hierarchy article list
  Future<PaginatedRespModel<ArticleModel>> getHierarchyArticleList(
      {int page, int pageSize, required int cid});

  /// 4.2 project article list
  Future<PaginatedRespModel<ArticleModel>> getProjectArticleList(
      {int page, int pageSize, required int cid});

  /// 7.1 search article list
  Future<PaginatedRespModel<ArticleModel>> getSearchArticleList(
      {int page, int pageSize, required String k});

  /// 15.2 wx article list
  Future<PaginatedRespModel<ArticleModel>> getWxArticleList(
      {int page, int pageSize, required int id});
}

class ArticleRemoteDataSrcImpl implements ArticleRemoteDataSrc {
  const ArticleRemoteDataSrcImpl(this._httpService);

  final HttpService _httpService;

  @override
  Future<PaginatedRespModel<ArticleModel>> getArticleList(
      {int page = 0, int pageSize = 10}) async {
    final responseData = await _httpService.get('/article/list/$page/json',
        queryParameters: {"page_size": pageSize});
    return PaginatedRespModel<ArticleModel>.fromJson(
        responseData.data, ArticleModel.fromJsonModel);
  }

  /// 1.4 hotkey
  @override
  Future<List<HotkeyModel>> getHotkeys() async {
    final responseData = await _httpService.get('/hotkey/json');
    return (responseData.data as List<dynamic>)
        .map((e) => HotkeyModel.fromJson(e))
        .toList();
  }

  /// 1.5 index top articles
  @override
  Future<List<ArticleModel>> getTopList() async {
    final responseData = await _httpService.get('/article/top/json');
    return (responseData.data as List<dynamic>)
        .map((e) => ArticleModel.fromJson(e))
        .toList();
  }

  /// hierarchy article list
  @override
  Future<PaginatedRespModel<ArticleModel>> getHierarchyArticleList(
      {int page = 0,
      int pageSize = 10,
      required int cid,
      bool forceRefresh = true}) async {
    final responseData = await _httpService.get('/article/list/$page/json',
        queryParameters: {"page_size": pageSize, "cid": cid},
        forceRefresh: forceRefresh);
    return PaginatedRespModel<ArticleModel>.fromJson(
        responseData.data, ArticleModel.fromJsonModel);
  }

  /// project article list
  @override
  Future<PaginatedRespModel<ArticleModel>> getProjectArticleList(
      {int page = 0,
      int pageSize = 10,
      required int cid,
      bool forceRefresh = true}) async {
    final responseData = await _httpService.get('/project/list/$page/json',
        queryParameters: {"page_size": pageSize, "cid": cid},
        forceRefresh: forceRefresh);
    return PaginatedRespModel<ArticleModel>.fromJson(
        responseData.data, ArticleModel.fromJsonModel);
  }

  /// search article list
  @override
  Future<PaginatedRespModel<ArticleModel>> getSearchArticleList(
      {int page = 0,
      int pageSize = 10,
      required String k,
      bool forceRefresh = true}) async {
    final responseData = await _httpService.post('/article/query/$page/json',
        data: {"k": k, "page_size": pageSize});
    return PaginatedRespModel<ArticleModel>.fromJson(
        responseData.data, ArticleModel.fromJsonModel);
  }

  @override
  Future<PaginatedRespModel<ArticleModel>> getWxArticleList(
      {int page = 0,
      int pageSize = 10,
      required int id,
      bool forceRefresh = true}) async {
    final responseData = await _httpService.get(
        '/wxarticle/list/$id/$page/json',
        queryParameters: {"page_size": pageSize},
        forceRefresh: forceRefresh);
    return PaginatedRespModel<ArticleModel>.fromJson(
        responseData.data, ArticleModel.fromJsonModel);
  }
}
