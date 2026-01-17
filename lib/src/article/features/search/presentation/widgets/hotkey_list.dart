import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/indicators/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/indicators/loading_view.dart';
import 'package:flutter_wanandroid2/core/utils/constants/constants.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/article/features/search/presentation/app/riverpod/hotkey_provider.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HotkeyList extends ConsumerWidget {
  const HotkeyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    final hotkeys = ref.watch(hotkeyProvider);
    return hotkeys.when(
        data: (data) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.w,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Gap(15.w),
                        Text(
                          l10n.search_hotkey,
                          style: TextStyle(fontSize: 38.w),
                        )
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 20.w,
                    runSpacing: 20.w,
                    children: data
                        .map((e) => ActionChip(
                            label: Text(
                              e.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            side: BorderSide.none,
                            backgroundColor:
                                Constants.chapterBgColor[e.id % 10],
                            onPressed: () {
                              context.push("/search/result?key=${e.name}");
                            }))
                        .toList(),
                  )
                ],
              ));
        },
        error: (error, stack) => ErrorView(
              error: error,
              onPressed: () => ref.invalidate(hotkeyProvider),
            ),
        loading: () => const LoadingView());
  }
}
