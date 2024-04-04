import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/common/widgets/keep_alive.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/src/article/presentation/widgets/article_list.dart';
import 'package:flutter_wanandroid2/src/hierarchy/presentation/app/riverpod/hierarchy_provider.dart';

class HierarchyArticlesScreen extends ConsumerWidget {
  const HierarchyArticlesScreen(
      {super.key, required this.sectionId, required this.cateId});

  final int sectionId;
  final int cateId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hierarchy = ref.watch(hierarchyProvider).requireValue;
    final section = hierarchy.firstWhere((element) => element.id == sectionId);
    final initialIndex =
        section.children.indexWhere((element) => element.id == cateId);

    return DefaultTabController(
        initialIndex: initialIndex,
        length: section.children.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(section.name),
            bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                tabs: section.children.map((e) => Tab(text: e.name)).toList()),
          ),
          body: TabBarView(
            children: section.children
                .map((e) => KeepAliveWrapper(
                        child: ProviderScope(overrides: [
                      articleSourceProvider.overrideWith(
                          (ref) => (ArticleSource.hierarchy, e.id))
                    ], child: ArticleList())))
                .toList(),
          ),
        ));
  }
}
