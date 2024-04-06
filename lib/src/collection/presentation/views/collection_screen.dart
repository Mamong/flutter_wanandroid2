import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/collection/presentation/app/collection_provider.dart';
import 'package:flutter_wanandroid2/src/collection/presentation/widgets/collection_list.dart';

class CollectionScreen extends ConsumerWidget {
  CollectionScreen({super.key});

  final articleAdapterFamilyKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.menu_collection),
      ),
      body: CollectionList(
        articleAdapterFamilyKey: articleAdapterFamilyKey,
        fetchRequest: (int value) {
          ref
              .read(CollectionProvider(articleAdapterFamilyKey).notifier)
              .getCollectArticles(page: value);
        },
      ),
    );
  }
}
