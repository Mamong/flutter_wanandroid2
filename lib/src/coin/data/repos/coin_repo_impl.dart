import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/article/data/models/paginated_resp_model.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/coin/data/datasources/coin_remote_data_src.dart';
import 'package:flutter_wanandroid2/src/coin/data/models/coin_detail_model.dart';
import 'package:flutter_wanandroid2/src/coin/data/models/coin_info_model.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_detail.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';
import 'package:flutter_wanandroid2/src/coin/domain/repos/coin_repo.dart';

class CoinRepoImpl with ResultExt implements CoinRepo {
  const CoinRepoImpl(this._remoteDataSource);

  final CoinRemoteDataSrc _remoteDataSource;

  // @override
  // ResultFuture<Account> getUser() async {
  //   return await guard<Account>(() async {
  //     final result = await _remoteDataSource.getUser();
  //     return result.toDomainModel();
  //   });
  // }

  @override
  ResultFuture<PaginatedResp<CoinDetail>> getCoinDetails(
      {int page = 1, int pageSize = 10}) async {
    return await guard<PaginatedResp<CoinDetail>>(() async {
      final result = await _remoteDataSource.getCoinDetails(
          page: page, pageSize: pageSize);
      return result
          .toDomainModel<CoinDetail, CoinDetailModel>((e) => e.toDomainModel());
    });
  }

  @override
  ResultFuture<CoinInfo> getCoinInfo() async {
    return await guard<CoinInfo>(() async {
      final result = await _remoteDataSource.getCoinInfo();
      return result.toDomainModel();
    });
  }
}
