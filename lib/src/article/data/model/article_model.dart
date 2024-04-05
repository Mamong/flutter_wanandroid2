import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable(createToJson: false)
class ArticleModel {
  final String author; //
  final int chapterId; //
  final String chapterName; //
  final int courseId; //
  final String desc; //
  final String envelopePic; //
  final int id; //
  final String link; //
  final String niceDate; //
  final String origin; //
  final int? originId; //
  final int publishTime; //
  final String? superChapterName;
  final String title; //
  final int userId; //
  final int visible; //
  final int zan; //

  ArticleModel(
      {this.originId,
      required this.author,
      required this.chapterId,
      required this.chapterName,
      required this.courseId,
      required this.desc,
      required this.envelopePic,
      required this.id,
      required this.link,
      required this.niceDate,
      required this.origin,
      required this.publishTime,
      this.superChapterName,
      required this.title,
      required this.userId,
      required this.visible,
      required this.zan});

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  static ArticleModel fromJsonModel(Object? json) =>
      ArticleModel.fromJson(json as Map<String, dynamic>);
}

@JsonSerializable(createToJson: false)
class TagModel {
  final String name;
  final String url;

  TagModel({required this.name, required this.url});

  static const fromJson = _$TagModelFromJson;
}

extension ArticleModeltoDomain on ArticleModel {
  Article toDomainModel({bool isTop = false}) {
    return Article(
      isTop: isTop,
      author: author,
      chapterId: chapterId,
      chapterName: chapterName,
      collect: true,
      desc: desc,
      envelopePic: envelopePic,
      id: id,
      link: link,
      niceDate: niceDate,
      origin: origin,
      originId: originId,
      publishTime: publishTime,
      // shareDate: shareDate,
      shareUser: "shareUser",
      // superChapterId: superChapterId,
      superChapterName: superChapterName ?? "文章",
      title: title,
      type: 0,
      userId: userId,
      zan: zan,
    );
  }
}
