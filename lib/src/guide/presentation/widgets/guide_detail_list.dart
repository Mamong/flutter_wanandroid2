import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_wanandroid2/core/common/widgets/indicators/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/indicators/loading_view.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/app/riverpod/guide_list_provider.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/widgets/guide_detail_section.dart';
import 'package:scrollable_positioned_list_extended/scrollable_positioned_list_extended.dart';

class GuideDetailList extends ConsumerWidget {
  const GuideDetailList(
      {required this.itemScrollController,
      required this.itemPositionsListener,
      super.key});

  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guide = ref.watch(guideListProvider);
    return guide.when(
        data: (data) {
          return ScrollablePositionedList.separated(
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
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
          debugPrint(error.toString());
          return ErrorView(
            error: error,
            onPressed: () => ref.invalidate(guideListProvider),
          );
        },
        loading: () => const LoadingView());
  }
}
