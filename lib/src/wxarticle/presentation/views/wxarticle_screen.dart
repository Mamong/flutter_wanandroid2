import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/keep_alive.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/src/article/presentation/widgets/article_list.dart';
import 'package:flutter_wanandroid2/src/wxarticle/presentation/app/riverpod/wxarticle_tree_provider.dart';

class WXArticleScreen extends ConsumerWidget {
  const WXArticleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    final wxarticle = ref.watch(wxarticleTreeProvider);
    return wxarticle.when(
        data: (section) {
          return DefaultTabController(
              length: section.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(l10n.tab_public_account),
                  bottom: TabBar(
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      isScrollable: true,
                      tabs: section.map((e) => Tab(text: e.name)).toList()),
                ),
                body: TabBarView(
                  children: section
                      .map((e) => KeepAliveWrapper(
                              child: ProviderScope(overrides: [
                            articleSourceProvider.overrideWith(
                                (ref) => (ArticleSource.wxarticle, e.id))
                          ], child: const ArticleList())))
                      .toList(),
                ),
              ));
        },
        error: (error, stack) {
          print(stack);
          return Scaffold(
              appBar: AppBar(title: Text(l10n.tab_public_account)),
              body: const ErrorView());
        },
        loading: () => Scaffold(
            appBar: AppBar(title: Text(l10n.tab_public_account)),
            body: const LoadingView()));
  }
}
