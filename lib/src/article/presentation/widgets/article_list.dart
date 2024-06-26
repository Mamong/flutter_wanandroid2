import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/res/styles/button.dart';
import 'package:flutter_wanandroid2/core/res/styles/colors.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/core/utils/constants/constants.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_provider.dart';
import 'package:flutter_wanandroid2/src/collection/presentation/widgets/collection_icon.dart';
import 'package:flutter_wanandroid2/core/common/widgets/indicators.dart';

part 'article_list_item.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class ArticleList extends ConsumerStatefulWidget {
  const ArticleList({super.key, this.header});

  final Widget? header;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArticleListState();
}

class _ArticleListState extends ConsumerState<ArticleList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final (source, ext) = ref.read(articleSourceProvider);
    final articleList = ref.watch(ArticleAdapterProvider(source, ext));
    final hasHeader = widget.header != null;

    ref.listen(ArticleAdapterProvider(source, ext), (_, next) {
      if (next.isLoading) {
        //loading indicator shown by SmartRefresher, do nothing here
      } else {
        //deal with loading result
        if (next.hasError) {
          CoreUtils.showSnackBar(context, message: next.error.toString());
        }

        if (_refreshController.isRefresh) {
          print("isRefresh");
          _refreshController.refreshCompleted();
        } else if (_refreshController.isLoading) {
          print("isLoading");
          _refreshController.loadComplete();
        } else {
          // data arrives, but SmartRefresher is idle, for initialRefresh is false
          print("is idle");
          return;
        }
        if (next.requireValue.hasMore) {
          _refreshController.resetNoData();
        } else {
          _refreshController.loadNoData();
        }
      }
    });

    return articleList.when(
        skipError: true,
        skipLoadingOnReload: true,
        data: (data) {
          if (data.datas.isEmpty) {
            return EmptyView(
                onPressed: () =>
                    ref.invalidate(ArticleAdapterProvider(source, ext)));
          }

          return SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: () {
                if (articleList.isLoading) return;
                ref.invalidate(ArticleAdapterProvider(source, ext));
              },
              onLoading: () {
                if (articleList.isLoading) return;
                ref
                    .read(ArticleAdapterProvider(source, ext).notifier)
                    .loadMore();
              },
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0 && hasHeader) {
                      return widget.header;
                    }
                    print("=====$index");
                    return ProviderScope(overrides: [
                      indexProvider
                          .overrideWith((ref) => index - (hasHeader ? 1 : 0))
                    ], child: const ArticleListItem());
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Gap(24.w),
                  itemCount: data.datas.length + (hasHeader ? 1 : 0)));
        },
        //显示初次加载错误，一般用于恢复，譬如网络异常或者未登录等
        error: (Object error, StackTrace? stackTrace) {
          print(stackTrace.toString());
          return ErrorView(
            error: error,
            onPressed: () {
              ref.invalidate(ArticleAdapterProvider(source, ext));
            },
          );
        },
        //显示初次loading
        loading: () {
          return const LoadingView();
        });
  }
}
