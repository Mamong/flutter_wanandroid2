import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/article/features/search/presentation/widgets/hotkey_list.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startSearch(BuildContext context) {
    final text = controller.text;
    if (text.isEmpty) {
      final l10n = AppLocalizations.of(context);
      CoreUtils.showSnackBar(context, message: l10n.tips_search_keywords);
      return;
    }
    context.push('/search/result?key=$text');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: l10n.search_placeholder,
              hintStyle: const TextStyle(color: Colors.white),
            ),
            onEditingComplete: () {
              startSearch(context);
            }),
        actions: [
          IconButton(
            onPressed: () {
              startSearch(context);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: const HotkeyList(),
    );
  }
}
