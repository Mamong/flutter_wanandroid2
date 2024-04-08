import 'dart:async';
import 'package:riverpod/src/async_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/usecase/usecase.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';


mixin PaginationController<T> on AsyncNotifierBase<PaginatedResp<T>> {
  PaginatedParams nextPage(PaginatedResp<T> current) {
    return PaginatedParams(
        pageSize: current.size, page: current.curPage + 1);
  }

  FutureOr<PaginatedResp<T>> loadData(PaginatedParams query);

  Future<void> loadMore() async {
    final oldState = state;
    if (!oldState.requireValue.hasMore) return;
    //not refresh, so will return AsyncData, not required
    state = AsyncLoading<PaginatedResp<T>>().copyWithPrevious(oldState);
    // cause error
    // state = await AsyncValue.guard<PaginatedResponseRM<T>>(() async {
    //   final res = await loadData(nextPage(oldState.requireValue));
    //   res.datas.insertAll(0, state.requireValue.datas);
    //   return res;
    // });
    try {
      final res = await loadData(nextPage(oldState.requireValue));
      res.datas.insertAll(0, state.requireValue.datas);
      state = AsyncValue.data(res);
    } catch (err, stack) {
      state = AsyncError<PaginatedResp<T>>(err, stack)
          .copyWithPrevious(oldState);
    }
  }

  bool canLoadMore() {
    if (state.isLoading) return false;
    if (!state.hasValue) return false;
    if (!state.requireValue.hasMore) return false;
    return true;
  }
}