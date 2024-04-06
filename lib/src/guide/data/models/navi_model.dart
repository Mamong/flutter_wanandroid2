import 'package:flutter_wanandroid2/src/article/data/models/article_model.dart';
import 'package:flutter_wanandroid2/src/guide/domain/entities/navi.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navi_model.g.dart';

@JsonSerializable(createToJson: false)
class NaviModel {
  final int cid;
  final String name;
  final List<ArticleModel> articles;

  const NaviModel(
      {required this.cid, required this.name, required this.articles});

  factory NaviModel.fromJson(Map<String, dynamic> json) =>
      _$NaviModelFromJson(json);
}

extension NaviModeltoDomain on NaviModel {
  Navi toDomainModel() {
    return Navi(
        cid: cid,
        name: name,
        articles: articles.map((e) => e.toDomainModel()).toList());
  }
}
