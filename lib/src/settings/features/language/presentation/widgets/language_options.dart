import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/common/app/app_settings_provider.dart';
import 'package:flutter_wanandroid2/core/utils/enums/language_enum.dart';

class LanguageOptions extends ConsumerWidget {
  const LanguageOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);

    return ListView(
        children: ListTile.divideTiles(
                context: context,
                tiles: Language.values
                    .map((e) => ListTile(
                          tileColor: Colors.white,
                          title: Text(e.title),
                          trailing: e.code == settings.language
                              ? const Icon(Icons.check)
                              : null,
                          onTap: () {
                            final setLanguageProvider =
                                ref.read(appSettingsProvider.notifier);
                            setLanguageProvider.setLanguage(e.code);
                          },
                        ))
                    .toList())
            .toList());
  }
}
