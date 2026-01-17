import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:flutter_wanandroid2/src/home/domain/usecases/get_project_tree.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_tree_provider.g.dart';

@riverpod
Future<List<Tree>> projectTree(Ref ref) async {
  final getProjectTree = sl<GetProjectTree>();
  return await getProjectTree();
}