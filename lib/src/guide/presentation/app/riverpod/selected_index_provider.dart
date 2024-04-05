import 'package:flutter_riverpod/flutter_riverpod.dart';

final gIndexProvider = StateProvider<int>((ref) => 0);

final selectedIndexProvider = StateProvider<int>((ref) => 0);