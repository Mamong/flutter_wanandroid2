import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/app/current_user_provider.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/src/article/presentation/widgets/article_list.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_wanandroid2/core/common/widgets/empty_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:flutter_wanandroid2/src/collection/presentation/app/collection_provider.dart';

/// infinite_scroll_pagination showcase

class CollectionList extends ConsumerStatefulWidget {
  const CollectionList(
      {super.key,
      required this.articleAdapterFamilyKey,
      required this.fetchRequest,
      this.firstPage = 0});

  final GlobalKey articleAdapterFamilyKey;
  final ValueChanged<int> fetchRequest;
  final int firstPage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CollectionListState();
}

class _CollectionListState extends ConsumerState<CollectionList> {
  late PagingController<int, Article> pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    currentPage = widget.firstPage;
    pageController =
        PagingController<int, Article>(firstPageKey: widget.firstPage);
    pageController.addPageRequestListener((pageKey) {
      currentPage = pageKey;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.fetchRequest(pageKey);
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(collectionProvider(widget.articleAdapterFamilyKey),
        (previous, next) {
      if (next is CollectionError) {
        pageController.error = next.message;
        CoreUtils.showSnackBar(context, message: "${next.message}");
      } else if (next is CollectionFetched) {
        final articles = next.list;
        if (next.hasMore) {
          final nextPage = currentPage + 1;
          pageController.appendPage(articles, nextPage);
        } else {
          pageController.appendLastPage(articles);
        }
      }
    });

    ref.listen(currentUserProvider, (previous, next) {
      pageController.itemList = pageController.itemList!
          .where(
              (element) => next?.collectIds.contains(element.originId) ?? false)
          .toList();
    });

    return RefreshIndicator(
        onRefresh: () => Future.sync(
              () => pageController.refresh(),
            ),
        child: PagedListView<int, Article>.separated(
          pagingController: pageController,
          builderDelegate: PagedChildBuilderDelegate<Article>(
              itemBuilder: (context, article, index) =>
                  ProviderScope(overrides: [
                    articleSourceProvider
                        .overrideWith((ref) => (ArticleSource.collection, null))
                  ], child: ArticleItem(article: article)),
              firstPageProgressIndicatorBuilder: (_) => LoadingView(),
              firstPageErrorIndicatorBuilder: (_) => ErrorView(),
              newPageProgressIndicatorBuilder: (_) => LoadingView(),
              newPageErrorIndicatorBuilder: (_) => LoadingView(),
              noItemsFoundIndicatorBuilder: (_) => EmptyView(),
              noMoreItemsIndicatorBuilder: (_) => EmptyView()),
          separatorBuilder: (_, __) => Gap(24.w),
        ));
  }
}