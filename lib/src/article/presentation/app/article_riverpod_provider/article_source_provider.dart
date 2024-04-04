import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ArticleSource {
  home,
  search,
  hierarchy,
  project,
  wxarticle,
}

final articleSourceProvider = StateProvider<(ArticleSource, dynamic)>(
    (ref) => (ArticleSource.home, null));
