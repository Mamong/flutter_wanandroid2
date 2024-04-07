import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_detail.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';
import 'package:flutter_wanandroid2/src/coin/domain/usecases/get_coin_details.dart';
import 'package:flutter_wanandroid2/src/coin/domain/usecases/get_coin_info.dart';
import 'package:network/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_coin_provider.g.dart';
part 'user_coin_state.dart';

@riverpod
class UserCoin extends _$UserCoin {
  @override
  UserCoinState build([GlobalKey? familyKey]) {
    _getCoinInfo = sl<GetCoinInfo>();
    _getCoinDetails = sl<GetCoinDetails>();
    return const UserCoinInitial();
  }

  late GetCoinInfo _getCoinInfo;
  late GetCoinDetails _getCoinDetails;

  Future<void> getCoinDetails({int page = 1, int pageSize = 10}) async {
    state = const GettingUserCoinDetails();
    final result =
        await _getCoinDetails(PaginatedParams(page: page, pageSize: pageSize));
    result.fold(
      (failure) => state = UserCoinError(failure),
      (result) {
        state = FetchedUserCoinDetails(result);
      },
    );
  }

  Future<void> getCoinInfo() async {
    state = const GettingUserCoinInfo();
    final result = await _getCoinInfo();
    result.fold(
      (failure) => state = UserCoinError(failure),
      (result) {
        state = FetchedUserCoinInfo(result);
      },
    );
  }
}
