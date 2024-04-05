import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/src/home/presentation/app/riverpod/banner_provider.dart';
import 'package:flutter_wanandroid2/src/home/presentation/app/riverpod/banner_select_provider.dart';

class HomeBannerTitle extends ConsumerWidget {
  const HomeBannerTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(bannerProvider).requireValue;
    final index = ref.watch(bannerSelectProvider);
    final banner = banners[index];
    return Container(
        height: 50.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(color: Colors.black.withAlpha(85)),
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white, fontSize: 28.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                banner.title,
              ),
              Text(
                "${index + 1}/${banners.length}",
              ),
            ],
          ),
        ));
  }
}
