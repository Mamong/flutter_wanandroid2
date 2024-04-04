import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/src/home/presentation/app/riverpod/banner_provider.dart';

class HomeBanner extends ConsumerWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banner = ref.watch(bannerProvider);
    return banner.when(
        data: (data) {
          return Container(
            height: 200,
            color: Colors.blue,
          );
        },
        error: (error, stack) => const ErrorView(),
        loading: () => const LoadingView());
  }
}
