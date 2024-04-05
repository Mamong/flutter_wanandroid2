import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/src/home/presentation/app/riverpod/banner_provider.dart';
import 'package:flutter_wanandroid2/src/home/presentation/app/riverpod/banner_select_provider.dart';
import 'package:flutter_wanandroid2/src/home/presentation/widgets/home_bannerr_title.dart';

class HomeBanner extends ConsumerWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(bannerProvider);
    return banners.when(
        data: (data) {
          return Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 380.w,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, _) {
                      ref.read(bannerSelectProvider.notifier).state = index;
                    }),
                items: data.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CachedNetworkImage(
                        imageUrl: banner.imagePath,
                        height: 380.w,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        //placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      );
                    },
                  );
                }).toList(),
              ),
              const Positioned(
                  bottom: 0, left: 0, right: 0, child: HomeBannerTitle())
            ],
          );
        },
        error: (error, stack) => const ErrorView(),
        loading: () => const LoadingView());
  }
}
