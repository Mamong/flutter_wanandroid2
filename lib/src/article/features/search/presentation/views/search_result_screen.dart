import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/src/article/presentation/widgets/article_list.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.k});

  final String k;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(k),
      ),
      body: ProviderScope(overrides: [
        articleSourceProvider.overrideWith((ref) => (ArticleSource.search, k))
      ], child: const ArticleList()),
    );
  }
}
