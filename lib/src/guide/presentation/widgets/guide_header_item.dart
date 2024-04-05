import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/app/app_settings_provider.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/app/riverpod/guide_list_provider.dart';
import 'package:flutter_wanandroid2/src/guide/presentation/app/riverpod/selected_index_provider.dart';

class GuideHeaderItem extends ConsumerWidget {
  const GuideHeaderItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsProvider = ref.watch(appSettingsProvider);
    final guide = ref.watch(guideListProvider).requireValue;
    final index = ref.read(gIndexProvider);
    final section = guide[index];

    /// only focus on selection change
    final selected =
        ref.watch(selectedIndexProvider.select((value) => value == index));

    return Container(
      height: 98.w,
      decoration: selected ? const BoxDecoration(color: Colors.white) : null,
      child: Center(
          child: Text(
        section.name,
        style: TextStyle(
            color: selected ? settingsProvider.themeColor : Colours.MAIN_TEXT),
      )),
    );
  }
}
