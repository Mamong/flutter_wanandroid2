import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_detail.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';

abstract class CoinRepo {
  // ResultFuture<Account> getUser();

  ResultFuture<PaginatedResp<CoinDetail>> getCoinDetails(
      {int page, int pageSize});

  ResultFuture<CoinInfo> getCoinInfo();
}
