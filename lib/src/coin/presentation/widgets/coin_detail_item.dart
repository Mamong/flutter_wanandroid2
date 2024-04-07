import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/skeleton.dart';
import 'package:gap/gap.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_detail.dart';

class CoinDetailItem extends StatelessWidget {
  const CoinDetailItem({required this.detail, super.key});

  final CoinDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(28.w),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detail.reason,
                style: TextStyle(fontSize: 30.w, color: Colours.MAIN_TEXT),
              ),
              Gap(12.w),
              Text(detail.desc,
                  style: TextStyle(fontSize: 28.w, color: Colours.TEXT_DARK)),
            ],
          ),
          const Spacer(),
          Text("+${detail.coinCount}",
              style: TextStyle(
                  fontSize: 30.w,
                  fontWeight: FontWeight.bold,
                  color: Colours.WX_GREEN)),
        ],
      ),
    );
  }
}

class CoinDetailItemSkeleton extends StatelessWidget {
  const CoinDetailItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: const BottomBorderDecoration(),
      padding: const EdgeInsets.all(14),
      child: const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonBox(width: 30, height: 20),
              Gap(6),
              SkeletonBox(width: 280, height: 20),
            ],
          ),
          Spacer(),
          SkeletonBox(width: 30, height: 20),
        ],
      ),
    );
  }
}
