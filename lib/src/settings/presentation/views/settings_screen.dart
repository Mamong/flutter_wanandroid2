import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/src/settings/presentation/widgets/settings_options.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: SettingsOptions(),
    );
  }
}