import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/app/riverpod/guide_list_provider.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/widgets/guide_detail_section.dart';
import 'package:gap/gap.dart';

class GuideDetailList extends ConsumerWidget {
  const GuideDetailList({super.key, required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guide = ref.watch(guideListProvider);
    return guide.when(
        data: (data) {
          return ListView.separated(
            controller: controller,
            padding: EdgeInsets.all(25.w),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final section = data[index];
              return GuideDetailSection(section: section);
            },
            separatorBuilder: (BuildContext context, int index) => Gap(20.w),
          );
        },
        error: (error, stack) {
          print(error.toString());
          return const ErrorView();
        },
        loading: () => const LoadingView());
  }
}