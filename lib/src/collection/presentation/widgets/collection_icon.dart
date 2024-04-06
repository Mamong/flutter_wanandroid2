import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/app/current_user_provider.dart';
import 'package:flutter_wanandroid2/core/res/styles/button.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/src/auth/presentation/app/riverpod/auth_provider.dart';
import 'package:flutter_wanandroid2/src/collection/presentation/app/collection_provider.dart';

class CollectionIcon extends ConsumerWidget {
  CollectionIcon({super.key, required this.id, this.originId});

  final int id;
  final int? originId;

  final articleAdapterFamilyKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (source, _) = ref.read(articleSourceProvider);

    final isCollect = ref.watch(currentUserProvider.select((user) =>
        user?.collectIds.any((element) =>
            (source == ArticleSource.collection ? originId : id) == element) ??
        false));

    ref.listen(CollectionProvider(articleAdapterFamilyKey), (_, next) {
      if (next is CollectionError) {
        CoreUtils.showSnackBar(context, message: next.message);
      } else if (next is AddedToCollection || next is RemovedFromCollection) {
        CoreUtils.postFrameCall(() {
          ref.read(authProvider().notifier).getUser();
        });
      }
    });

    return IconButton(
        style: ButtonStyles.shrinkIconButton(const Size(30, 30)),
        onPressed: () {
          if (source == ArticleSource.collection) {
            ref
                .read(CollectionProvider(articleAdapterFamilyKey).notifier)
                .uncollectMyArticle(id: id, originId: originId ?? -1);
            return;
          }
          if (isCollect) {
            ref
                .read(CollectionProvider(articleAdapterFamilyKey).notifier)
                .uncollectArticle(id);
          } else {
            ref
                .read(CollectionProvider(articleAdapterFamilyKey).notifier)
                .collectArticle(id);
          }
        },
        icon: Icon(
          Icons.favorite,
          size: 50.w,
          color: Color(isCollect ? 0xFFFA8072 : 0xFFE0E0E0),
        ));
  }
}
