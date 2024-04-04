import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/settings/features/language/presentation/widgets/language_options.dart';


class SettingsLanguageView extends StatelessWidget {
  const SettingsLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.language),
      ),
      body: const LanguageOptions(),
    );
  }
}