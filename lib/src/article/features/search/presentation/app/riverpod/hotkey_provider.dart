import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/article/features/search/domain/entities/hotkey.dart';
import 'package:flutter_wanandroid2/src/article/features/search/domain/usecases/get_hotkeys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hotkey_provider.g.dart';

@riverpod
Future<List<Hotkey>> hotkey(Ref ref) async {
  final getHotkeys = sl<GetHotkeys>();
  return await getHotkeys();
}
