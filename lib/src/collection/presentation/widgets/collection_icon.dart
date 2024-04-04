import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid2/core/common/app/current_user_provider.dart';
import 'package:flutter_wanandroid2/core/utils/core_utils.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_provider.dart';
import 'package:flutter_wanandroid2/src/article/presentation/app/article_riverpod_provider/article_source_provider.dart';
import 'package:flutter_wanandroid2/src/article/presentation/widgets/article_list.dart';
import 'package:flutter_wanandroid2/src/auth/presentation/app/riverpod/auth_provider.dart';
import 'package:flutter_wanandroid2/src/collection/presentation/app/collection_provider.dart';

class CollectionIcon extends ConsumerWidget {
  CollectionIcon({super.key});

  final articleAdapterFamilyKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (source,ext) = ref.read(articleSourceProvider);

    final index = ref.read(indexProvider);
    final article =
        ref.watch(ArticleAdapterProvider(source,ext)).requireValue.datas[index];

    final user = ref.watch(currentUserProvider);
    final isCollect =
        user?.collectIds.any((element) => article.id == element) ?? false;

    ref.listen(CollectionProvider(articleAdapterFamilyKey), (_, next) {
      if(next is CollectionError){
        CoreUtils.showSnackBar(context, message: next.message);
      } else if(next is AddedToCollection || next is RemovedFromCollection){
        print("=====AddedToCollection or");
        CoreUtils.postFrameCall(() {
          ref.read(authProvider().notifier).getUser();
        });
      }
    });

    return IconButton(
        onPressed: () {
          if(isCollect){
            ref.read(CollectionProvider(articleAdapterFamilyKey).notifier).uncollectArticle(article.id);
          }else{
            ref.read(CollectionProvider(articleAdapterFamilyKey).notifier).collectArticle(article.id);
          }
        },
        icon: Icon(
          Icons.favorite,
          size:50.w,
          color: Color(isCollect ? 0xFFFA8072 : 0xFFE0E0E0),
        ));
  }
}
