import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/app/riverpod/guide_list_provider.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/app/riverpod/guide_select_provider.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/widgets/guide_header_item.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/widgets/guide_detail_list.dart';

class GuideList extends ConsumerStatefulWidget {
  const GuideList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => GuideListState();
}

class GuideListState extends ConsumerState<GuideList> {
  final ItemScrollController leftItemScrollController = ItemScrollController();
  final ItemPositionsListener leftItemPositionsListener =
      ItemPositionsListener.create();

  final ItemScrollController rightItemScrollController = ItemScrollController();
  final ItemPositionsListener rightItemPositionsListener =
      ItemPositionsListener.create();

  bool isLeftPress = false;

  @override
  void initState() {
    super.initState();

    rightItemPositionsListener.itemPositions.addListener(() async {
      await handleRightListDrag();
    });
  }

  Future<void> handleLeftListPress(int index) async {
    isLeftPress = true;
    ref.read(guideSelectProvider.notifier).state = index;
    // scroll to middle of screen
    await scrollTo(leftItemScrollController, index - 5);
    // scroll to top of screen
    await scrollTo(rightItemScrollController, index);
  }

  Future<void> handleRightListDrag() async {
    if (isLeftPress) {
      return;
    }
    final (min, _) = getVisibleRange(rightItemScrollController);
    if (ref.read(guideSelectProvider) == min) return;
    ref.read(guideSelectProvider.notifier).state = min ?? 0;
    await scrollTo(leftItemScrollController, min ?? 0 - 5);
  }

  Future<void> scrollTo(ItemScrollController controller, int index) async {
    // invalid index
    if (index < 0) return;
    final (min, max) = getVisibleRange(controller);
    final total = ref.read(guideListProvider).requireValue.length;
    // if max index is shown, can't scroll bigger than min
    if (max == total - 1 && index >= min!) return;
    await controller.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic);
  }

  (int?, int?) getVisibleRange(ItemScrollController controller) {
    late ItemPositionsListener listener;
    if (controller == leftItemScrollController) {
      listener = leftItemPositionsListener;
    } else {
      listener = rightItemPositionsListener;
    }
    final positions = listener.itemPositions.value;
    int? min;
    int? max;
    if (positions.isNotEmpty) {
      // Determine the first visible item by finding the item with the
      // smallest trailing edge that is greater than 0.  i.e. the first
      // item whose trailing edge in visible in the viewport.
      min = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;
      // Determine the last visible item by finding the item with the
      // greatest leading edge that is less than 1.  i.e. the last
      // item whose leading edge in visible in the viewport.
      max = positions
          .where((ItemPosition position) => position.itemLeadingEdge < 1)
          .reduce((ItemPosition max, ItemPosition position) =>
              position.itemLeadingEdge > max.itemLeadingEdge ? position : max)
          .index;
    }
    return (min, max);
  }

  @override
  Widget build(BuildContext context) {
    final guide = ref.watch(guideListProvider);
    return guide.when(
        data: (data) {
          return Row(
            children: [
              SizedBox(
                width: 200.w,
                child: ScrollablePositionedList.builder(
                    itemScrollController: leftItemScrollController,
                    itemPositionsListener: leftItemPositionsListener,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            handleLeftListPress(index);
                          },
                          child: ProviderScope(
                            overrides: [
                              gIndexProvider.overrideWith((ref) => index)
                            ],
                            child: const GuideHeaderItem(),
                          ));
                    },
                    itemCount: data.length),
              ),
              Expanded(
                child: NotificationListener<ScrollUpdateNotification>(
                    onNotification: (details) {
                      /// scroll by user drag
                      if (details.dragDetails != null) {
                        isLeftPress = false;
                      }
                      return false;
                    },
                    child: GuideDetailList(
                      itemScrollController: rightItemScrollController,
                      itemPositionsListener: rightItemPositionsListener,
                    )),
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
