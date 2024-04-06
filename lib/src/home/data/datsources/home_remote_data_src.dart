import 'package:flutter_wanandroid2/src/home/data/models/banner_model.dart';
import 'package:flutter_wanandroid2/src/guide/data/models/navi_model.dart';
import 'package:flutter_wanandroid2/src/home/data/models/tree_model.dart';
import 'package:flutter_wanandroid2/src/home/data/models/website_model.dart';
import 'package:network/network.dart';

abstract class HomeRemoteDataSrc {
  /// 1.2 index banner
  Future<List<BannerModel>> getBanner();

  /// 1.3 often used websites
  Future<List<WebsiteModel>> getOftenUsedWebsites();

  /// hierarchy category
  Future<List<TreeModel>> getHierarchy();

  /// 3.1 guide data
  Future<List<NaviModel>> getGuideList();

  /// 4.1 project category
  Future<List<TreeModel>> getProjectTree();

  /// 15.1 wx article category
  Future<List<TreeModel>> getWXArticleTree();
}

class HomeRemoteDataSrcImpl implements HomeRemoteDataSrc {
  const HomeRemoteDataSrcImpl(this._httpService);

  final HttpService _httpService;

  /// 1.2 index banner
  @override
  Future<List<BannerModel>> getBanner() async {
    final responseData = await _httpService.get('/banner/json');
    return (responseData.data as List<dynamic>)
        .map((e) => BannerModel.fromJson(e))
        .toList();
  }

  /// 1.3 often used websites
  @override
  Future<List<WebsiteModel>> getOftenUsedWebsites() async {
    final responseData = await _httpService.get('/friend/json');
    return (responseData.data as List<dynamic>)
        .map((e) => WebsiteModel.fromJson(e))
        .toList();
  }

  /// hierarchy category
  @override
  Future<List<TreeModel>> getHierarchy() async {
    final responseData = await _httpService.get('/tree/json');
    return (responseData.data as List<dynamic>)
        .map((e) => TreeModel.fromJson(e))
        .toList();
  }

  /// 3.1 navi data
  @override
  Future<List<NaviModel>> getGuideList() async {
    final responseData = await _httpService.get('/navi/json');
    return (responseData.data as List<dynamic>)
        .map((e) => NaviModel.fromJson(e))
        .toList();
  }

  /// project category
  @override
  Future<List<TreeModel>> getProjectTree() async {
    final responseData = await _httpService.get('/project/tree/json');
    return (responseData.data as List<dynamic>)
        .map((e) => TreeModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<TreeModel>> getWXArticleTree() async {
    final responseData = await _httpService.get('/wxarticle/chapters/json');
    return (responseData.data as List<dynamic>)
        .map((e) => TreeModel.fromJson(e))
        .toList();
  }
}
