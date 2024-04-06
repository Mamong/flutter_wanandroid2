import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';
import 'package:flutter_wanandroid2/src/coin/presentation/app/riverpod/user_coin_provider.dart';

class CoinDetailHeader extends ConsumerWidget {
  const CoinDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coinInfo = ref.watch(UserCoinProvider());

    if (coinInfo is GettingUserCoinInfo) {
      return LoadingView();
    } else if (coinInfo is UserCoinError) {
      return ErrorView();
    } else if (coinInfo is FetchedUserCoinInfo) {
      final CoinInfo(:level, :rank, :coinCount) = coinInfo.result;
      final titleStyle = TextStyle(color: Colors.white, fontSize: 36.w);
      final contentStyle = TextStyle(
          color: Colors.white, fontSize: 56.w, fontWeight: FontWeight.bold);
      return Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "排名",
                    style: titleStyle,
                  ),
                  Text(rank, style: contentStyle),
                ],
              ),
              Column(
                children: [
                  Text(
                    "等级",
                    style: titleStyle,
                  ),
                  Text("$level", style: contentStyle),
                ],
              ),
              Column(
                children: [
                  Text(
                    "积分",
                    style: titleStyle,
                  ),
                  Text("$coinCount", style: contentStyle),
                ],
              ),
            ],
          ));
    } else {
      //mix state disadvantage
      return const SizedBox.shrink();
    }
  }
}
