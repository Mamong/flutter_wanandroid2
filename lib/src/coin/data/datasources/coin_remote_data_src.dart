import 'package:flutter_wanandroid2/src/article/data/models/paginated_resp_model.dart';
import 'package:flutter_wanandroid2/src/coin/data/models/coin_detail_model.dart';
import 'package:flutter_wanandroid2/src/coin/data/models/coin_info_model.dart';
import 'package:network/network.dart';

abstract class CoinRemoteDataSrc {
  // Future<AccountModel> getUser();

  Future<PaginatedRespModel<CoinDetailModel>> getCoinDetails(
      {int page, int pageSize});

  Future<CoinInfoModel> getCoinInfo();
}

class CoinRemoteDataSrcImpl implements CoinRemoteDataSrc {
  CoinRemoteDataSrcImpl(this._httpService);

  final HttpService _httpService;

  // @override
  // Future<AccountModel> getUser() async {
  //   final responseData = await _httpService.get('/user/lg/userinfo/json');
  //   return AccountModel.fromJson(responseData.data);
  // }

  @override
  Future<PaginatedRespModel<CoinDetailModel>> getCoinDetails(
      {int page = 1, int pageSize = 10}) async {
    final responseData = await _httpService.get('/lg/coin/list/$page/json',
        queryParameters: {"page": page, "pageSize": pageSize});
    return PaginatedRespModel<CoinDetailModel>.fromJson(
        responseData.data, CoinDetailModel.fromJsonModel);
  }

  @override
  Future<CoinInfoModel> getCoinInfo() async {
    final responseData = await _httpService.get('/lg/coin/userinfo/json');
    return CoinInfoModel.fromJson(responseData.data);
  }
}
