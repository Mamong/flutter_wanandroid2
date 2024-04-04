import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/app/riverpod/guide_list_provider.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/widgets/guide_header_item.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/widgets/guide_detail_list.dart';

class GuideList extends ConsumerWidget {
  GuideList({super.key});

  final ScrollController leftController = ScrollController();

  ///
  final ScrollController rightController = ScrollController()..addListener(() {});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guide = ref.watch(guideListProvider);
    return guide.when(
        data: (data) {
          return Row(
            children: [
              SizedBox(
                width: 200.w,
                child: ListView.builder(
                    controller: leftController,
                    itemBuilder: (context, index) {
                      final section = data[index];
                      return GuideHeaderItem(section: section);
                    },
                    itemCount: data.length),
              ),
              Expanded(
                child: GuideDetailList(
                  controller: rightController,
                ),
              )
            ],
          );
        },
        error: (error, stack) {
          print(error);
          return const ErrorView();
        },
        loading: () => const LoadingView());
  }
}
