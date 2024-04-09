import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/settings/presentation/widgets/settings_options.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.menu_settings),
      ),
      body: const SettingsOptions(),
    );
  }
}
