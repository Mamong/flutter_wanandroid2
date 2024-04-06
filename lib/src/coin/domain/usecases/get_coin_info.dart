import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';
import 'package:flutter_wanandroid2/src/coin/domain/repos/coin_repo.dart';

class GetCoinInfo extends UsecaseWithoutParams {
  const GetCoinInfo(this._repo);

  final CoinRepo _repo;

  @override
  ResultFuture<CoinInfo> call() => _repo.getCoinInfo();
}
