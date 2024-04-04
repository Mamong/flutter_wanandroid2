import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navi.g.dart';
@JsonSerializable(createToJson: false)
class Navi {
  final int cid;
  final String name;
  final List<Article> articles;

  const Navi(
      {required this.cid, required this.name, required this.articles});

  factory Navi.fromJson(Map<String, dynamic> json) =>
      _$NaviFromJson(json);
}