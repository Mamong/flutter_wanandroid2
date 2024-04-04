

import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/home/data/datsources/home_remote_data_src.dart';
import 'package:flutter_wanandroid2/src/home/data/models/banner_model.dart';
import 'package:flutter_wanandroid2/src/home/data/models/navi_model.dart';
import 'package:flutter_wanandroid2/src/home/data/models/tree_model.dart';
import 'package:flutter_wanandroid2/src/home/data/models/website_model.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/banner.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/navi.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/website.dart';
import 'package:flutter_wanandroid2/src/home/domain/repos/home_repo.dart';

class HomeRepoImpl with ResultExt implements HomeRepo {
  const HomeRepoImpl(this._remoteDataSource);

  final HomeRemoteDataSrc _remoteDataSource;

  @override
  Future<List<Banner>> getBanner() async {
    // return await guard<List<Banner>>(() async{
      final result = await _remoteDataSource.getBanner();
      return result.map((e) => e.toDomainModel()).toList();
    // });
  }

  @override
  Future<List<Navi>> getGuideList() async{
    // return await guard<List<Navi>>(() async{
      final result = await _remoteDataSource.getGuideList();
      return result.map((e) => e.toDomainModel()).toList();
    // });
  }

  @override
  Future<List<Tree>> getHierarchy() async{
    // return await guard<Tree>(() async{
      final result = await _remoteDataSource.getHierarchy();
      return result.map((e) => e.toDomainModel()).toList();
    // });
  }

  @override
  Future<List<Website>> getOftenUsedWebsites() async{
    // return await guard<List<Website>>(() async{
      final result = await _remoteDataSource.getOftenUsedWebsites();
      return result.map((e) => e.toDomainModel()).toList();
    // });
  }

  @override
  Future<List<Tree>> getProjectTree() async{
    // return await guard<Tree>(() async{
      final result = await _remoteDataSource.getProjectTree();
      return result.map((e) => e.toDomainModel()).toList();
    // });
  }

  @override
  Future<List<Tree>> getWXArticleTree() async{
    // return await guard<Tree>(() async{
    final result = await _remoteDataSource.getWXArticleTree();
    return result.map((e) => e.toDomainModel()).toList();
    // });
  }
}