import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/l10n/app_localizations.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/src/article/presentation/widgets/article_list.dart';
import 'package:flutter_wanandroid2/src/home/presentation/widgets/home_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Text(l10n.tab_home),
      ),
      body: ProviderScope(
          overrides: [
            articleSourceProvider
                .overrideWith((ref) => (ArticleSource.home, null))
          ],
          child: ArticleList(
            header: const HomeBanner(),
          )),
      // drawer: DrawerLayout(onNavigateTo: onNavigateTo,),
    );
  }
}
