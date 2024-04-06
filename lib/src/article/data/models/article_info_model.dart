import 'package:flutter_wanandroid2/src/article/data/models/article_model.dart';
import 'package:flutter_wanandroid2/src/article/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_info_model.g.dart';

@JsonSerializable(createToJson: false)
class ArticleInfoModel {
  final bool adminAdd;
  final String apkLink;
  final int audit;
  final String author; //
  final bool canEdit;
  final int chapterId; //
  final String chapterName; //
  final bool collect;
  final int courseId; //
  final String desc; //
  final String descMd;
  final String envelopePic; //
  final bool fresh;
  final String host;
  final int id; //
  final bool isAdminAdd;
  final String link; //
  final String niceDate; //
  final String niceShareDate;
  final String origin; //
  final int? originId; //
  final String prefix;
  final String projectLink;
  final int publishTime; //
  final int realSuperChapterId;
  final int selfVisible;
  final int? shareDate;
  final String shareUser;
  final int superChapterId;
  final String superChapterName;
  final List<TagModel> tags;
  final String title; //
  final int type;
  final int userId; //
  final int visible; //
  final int zan; //

  ArticleInfoModel(
      {this.originId,
      required this.adminAdd,
      required this.apkLink,
      required this.audit,
      required this.author,
      required this.canEdit,
      required this.chapterId,
      required this.chapterName,
      required this.collect,
      required this.courseId,
      required this.desc,
      required this.descMd,
      required this.envelopePic,
      required this.fresh,
      required this.host,
      required this.id,
      required this.isAdminAdd,
      required this.link,
      required this.niceDate,
      required this.niceShareDate,
      required this.origin,
      required this.prefix,
      required this.projectLink,
      required this.publishTime,
      required this.realSuperChapterId,
      required this.selfVisible,
      this.shareDate,
      required this.shareUser,
      required this.superChapterId,
      required this.superChapterName,
      required this.tags,
      required this.title,
      required this.type,
      required this.userId,
      required this.visible,
      required this.zan});

  factory ArticleInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleInfoModelFromJson(json);
  static ArticleInfoModel fromJsonModel(Object? json) =>
      ArticleInfoModel.fromJson(json as Map<String, dynamic>);
}

extension ArticleInfoModeltoDomain on ArticleInfoModel {
  Article toDomainModel({bool isTop = false}) {
    return Article(
      isTop: isTop,
      author: author,
      chapterId: chapterId,
      chapterName: chapterName,
      collect: collect,
      desc: desc,
      envelopePic: envelopePic,
      id: id,
      link: link,
      niceDate: niceDate,
      origin: origin,
      publishTime: publishTime,
      // shareDate: shareDate,
      shareUser: shareUser,
      // superChapterId: superChapterId,
      superChapterName: superChapterName,
      title: title,
      type: type,
      userId: userId,
      zan: zan,
    );
  }
}
