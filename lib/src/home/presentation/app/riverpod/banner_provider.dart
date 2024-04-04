import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/home/domain/entities/banner.dart';
import 'package:flutter_wanandroid2/src/home/domain/usecases/get_banner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banner_provider.g.dart';

@riverpod
Future<List<Banner>> banner(BannerRef ref) async {
  final getBanner = sl<GetBanner>();
  return await getBanner();
}
