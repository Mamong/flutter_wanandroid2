import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/src/hierarchy/presentation/widgets/hierarchy_section.dart';
import 'package:flutter_wanandroid2/src/hierarchy/presentation/app/riverpod/hierarchy_provider.dart';
import 'package:gap/gap.dart';

class HierarchyList extends ConsumerWidget {
  const HierarchyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hierarchy = ref.watch(hierarchyProvider);
    return hierarchy.when(
        data: (data) {
          return ListView.separated(
            padding: EdgeInsets.all(25.w),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final section = data[index];
              return HierarchySection(section: section);
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
