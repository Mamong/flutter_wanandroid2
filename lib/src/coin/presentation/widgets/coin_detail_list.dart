import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_detail.dart';
import 'package:flutter_wanandroid2/src/coin/presentation/app/riverpod/user_coin_provider.dart';
import 'package:flutter_wanandroid2/src/coin/presentation/widgets/coin_detail_header.dart';
import 'package:flutter_wanandroid2/src/coin/presentation/widgets/coin_detail_item.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/widgets/empty_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/error_view.dart';
import 'package:flutter_wanandroid2/core/common/widgets/loading_view.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';

class CoinDetailList extends ConsumerStatefulWidget {
  const CoinDetailList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CoinDetailListState();
}

class _CoinDetailListState extends ConsumerState<CoinDetailList> {
  late PagingController<int, CoinDetail> pageController;
  int currentPage = 1;
  final authUserFamilyKey = GlobalKey();

  void fetchRequest(int page) {
    ref
        .read(UserCoinProvider(authUserFamilyKey).notifier)
        .getCoinDetails(page: page);
  }

  @override
  void initState() {
    super.initState();
    pageController =
        PagingController<int, CoinDetail>(firstPageKey: currentPage);
    pageController.addPageRequestListener((pageKey) {
      currentPage = pageKey;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (pageKey == 1) {
          ref.read(UserCoinProvider().notifier).getCoinInfo();
        }
        fetchRequest(pageKey);
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
    ref.listen(UserCoinProvider(authUserFamilyKey), (previous, next) {
      if (next is UserCoinError) {
        pageController.error = next.message;
        CoreUtils.showSnackBar(context, message: next.message);
      } else if (next is FetchedUserCoinDetails) {
        final articles = next.result.datas;
        if (next.result.hasMore) {
          final nextPage = currentPage + 1;
          pageController.appendPage(articles, nextPage);
        } else {
          pageController.appendLastPage(articles);
        }
      }
    });

    return RefreshIndicator(
        onRefresh: () => Future.sync(
              () => pageController.refresh(),
            ),
        child: CustomScrollView(slivers: <Widget>[
          const SliverToBoxAdapter(child: CoinDetailHeader()),
          PagedSliverList<int, CoinDetail>.separated(
            pagingController: pageController,
            builderDelegate: PagedChildBuilderDelegate<CoinDetail>(
                itemBuilder: (context, detail, index) =>
                    CoinDetailItem(detail: detail),
                firstPageProgressIndicatorBuilder: (_) => LoadingView(),
                firstPageErrorIndicatorBuilder: (_) => ErrorView(),
                newPageProgressIndicatorBuilder: (_) => LoadingView(),
                newPageErrorIndicatorBuilder: (_) => LoadingView(),
                noItemsFoundIndicatorBuilder: (_) => EmptyView(),
                noMoreItemsIndicatorBuilder: (_) => EmptyView()),
            separatorBuilder: (_, __) => Gap(1.w),
          )
        ]));
  }
}
