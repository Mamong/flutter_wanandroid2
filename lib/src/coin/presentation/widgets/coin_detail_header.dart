import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_wanandroid2/core/common/widgets/skeleton.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';
import 'package:flutter_wanandroid2/src/coin/presentation/app/riverpod/user_coin_provider.dart';

class CoinDetailHeader extends ConsumerWidget {
  const CoinDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    final coinInfo = ref.watch(UserCoinProvider());

    if (coinInfo is GettingUserCoinInfo) {
      return const CoinDetailHeaderSkeleton();
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
                    l10n.points_rank,
                    style: titleStyle,
                  ),
                  Text(rank, style: contentStyle),
                ],
              ),
              Column(
                children: [
                  Text(
                    l10n.points_level,
                    style: titleStyle,
                  ),
                  Text("$level", style: contentStyle),
                ],
              ),
              Column(
                children: [
                  Text(
                    l10n.points_point,
                    style: titleStyle,
                  ),
                  Text("$coinCount", style: contentStyle),
                ],
              ),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }
}

class CoinDetailHeaderSkeleton extends StatelessWidget {
  const CoinDetailHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonList(
      length: 1,
      builder: (context, index) => Container(
          padding: EdgeInsets.symmetric(vertical: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                3,
                (index) => const Column(
                      children: [
                        SkeletonBox(width: 40, height: 20),
                        Gap(8),
                        SkeletonBox(width: 80, height: 30),
                      ],
                    )),
          )),
    );
  }
}
