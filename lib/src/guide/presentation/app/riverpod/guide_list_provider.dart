import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/navi.dart';
import 'package:flutter_wanandroid2/src/home/domain/usecases/get_guide_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guide_list_provider.g.dart';

@riverpod
Future<List<Navi>> guideList(GuideListRef ref) async {
  final getGuideList = sl<GetGuideList>();
  return await getGuideList();
}
