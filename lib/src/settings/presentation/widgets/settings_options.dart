import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/app/app_settings_provider.dart';
import 'package:flutter_wanandroid2/core/utils/enums/language_enum.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:theme/theme.dart';

class SettingsOptions extends ConsumerWidget {
  SettingsOptions({super.key});

  final showColorsNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    final settings = ref.watch(appSettingsProvider);
    final languageCode = settings.language;

    Language language = Language.values
        .firstWhere((Language item) => item.code == languageCode);

    return ListView(
      children: [
        ValueListenableBuilder(
            valueListenable: showColorsNotifier,
            builder: (_, value, __) {
              return ExpansionTile(
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                leading: const Icon(Icons.color_lens),
                title: Text(l10n.menu_theme),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.w,
                      color: settings.themeColor,
                    ),
                    AnimatedRotation(
                      turns: value ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: const Icon(Icons.arrow_downward),
                    )
                  ],
                ),
                onExpansionChanged: (expand) {
                  showColorsNotifier.value = expand;
                },
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(28.w, 0, 28.2, 15.w),
                    child: Wrap(
                      spacing: 15.w,
                      runSpacing: 15.w,
                      children: themeColors
                          .map((e) => GestureDetector(
                                onTap: () {
                                  final setThemeProvider =
                                      ref.read(appSettingsProvider.notifier);
                                  setThemeProvider.setThemeColor(e.color);
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 70.w,
                                  color: Color(e.color),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              );
            }),
        ListTile(
          tileColor: Colors.white,
          leading: const Icon(Icons.language),
          title: Text(l10n.language),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                language.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Icon(Icons.arrow_right_alt),
            ],
          ),
          onTap: () {
            context.push("/settings/language");
          },
        )
      ],
    );
  }
}
