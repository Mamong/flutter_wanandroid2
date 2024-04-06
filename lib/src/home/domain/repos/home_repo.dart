import 'package:flutter_wanandroid2/src/home/domain/entities/banner.dart';
import 'package:flutter_wanandroid2/src/guide/domain/entities/navi.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/website.dart';

abstract class HomeRepo {
  /// 1.2 index banner
  Future<List<Banner>> getBanner();

  /// 1.3 often used websites
  Future<List<Website>> getOftenUsedWebsites();

  /// hierarchy category
  Future<List<Tree>> getHierarchy();

  /// 3.1 guide data
  Future<List<Navi>> getGuideList();

  /// 4.1 project category
  Future<List<Tree>> getProjectTree();

  /// 15.1 wx article category
  Future<List<Tree>> getWXArticleTree();
}
