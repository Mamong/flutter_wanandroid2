import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';

import '../widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.register),
      ),
      body: const RegisterForm(),
    );
  }
}
