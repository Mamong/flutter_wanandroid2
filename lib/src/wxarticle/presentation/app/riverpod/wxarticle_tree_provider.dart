import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:flutter_wanandroid2/src/home/domain/usecases/get_wxarticle_tree.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wxarticle_tree_provider.g.dart';

@riverpod
Future<List<Tree>> wxarticleTree(Ref ref) async {
  final getProjectTree = sl<GetWXArticleTree>();
  return await getProjectTree();
}