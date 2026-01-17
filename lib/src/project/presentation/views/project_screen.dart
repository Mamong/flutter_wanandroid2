import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/common/widgets/keep_alive.dart';
import 'package:flutter_wanandroid2/core/common/widgets/indicators.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/src/article/presentation/widgets/article_list.dart';
import 'package:flutter_wanandroid2/src/project/presentation/app/riverpod/project_tree_provider.dart';

class ProjectScreen extends ConsumerWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final project = ref.watch(projectTreeProvider);

    return project.when(
        data: (section) {
          return DefaultTabController(
              length: section.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(l10n.tab_project),
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
                                (ref) => (ArticleSource.project, e.id))
                          ], child: const ArticleList())))
                      .toList(),
                ),
              ));
        },
        error: (error, stack) {
          debugPrint(error.toString());
          return Scaffold(
              appBar: AppBar(title: Text(l10n.tab_public_account)),
              body: ErrorView(
                error: error,
                onPressed: () => ref.invalidate(projectTreeProvider),
              ));
        },
        loading: () => Scaffold(
            appBar: AppBar(title: Text(l10n.tab_public_account)),
            body: const LoadingView()));
  }
}
