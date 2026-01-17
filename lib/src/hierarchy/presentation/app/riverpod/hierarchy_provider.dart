import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:flutter_wanandroid2/src/home/domain/usecases/get_hierarchy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hierarchy_provider.g.dart';

@riverpod
Future<List<Tree>> hierarchy(Ref ref) async {
  final getHierarchy = sl<GetHierarchy>();
  return await getHierarchy();
}