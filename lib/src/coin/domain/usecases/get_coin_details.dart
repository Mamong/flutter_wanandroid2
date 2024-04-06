import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_detail.dart';
import 'package:flutter_wanandroid2/src/coin/domain/repos/coin_repo.dart';

class GetCoinDetails
    extends UsecaseWithParams<PaginatedResp<CoinDetail>, PaginatedParams> {
  const GetCoinDetails(this._repo);

  final CoinRepo _repo;

  @override
  ResultFuture<PaginatedResp<CoinDetail>> call(PaginatedParams params) =>
      _repo.getCoinDetails(page: params.page, pageSize: params.pageSize);
}
