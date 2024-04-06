import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';

class Navi {
  final int cid;
  final String name;
  final List<Article> articles;

  const Navi({required this.cid, required this.name, required this.articles});
}
