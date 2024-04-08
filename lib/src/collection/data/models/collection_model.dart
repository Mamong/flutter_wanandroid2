import 'package:flutter_wanandroid2/src/collection/domain/entities/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_model.g.dart';

@JsonSerializable(createToJson: false)
class CollectionModel {
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

  CollectionModel(
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

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);
  static CollectionModel fromJsonModel(Object? json) =>
      CollectionModel.fromJson(json as Map<String, dynamic>);
}

extension CollectionModeltoDomain on CollectionModel {
  CollectionInfo toDomainModel() {
    return CollectionInfo(
      author: author,
      chapterId: chapterId,
      chapterName: chapterName,
      desc: desc,
      envelopePic: envelopePic,
      id: id,
      link: link,
      niceDate: niceDate,
      origin: origin,
      originId: originId,
      publishTime: publishTime,
      // shareDate: shareDate,
      // superChapterId: superChapterId,
      superChapterName: superChapterName ?? "文章",
      title: title,
      userId: userId,
      zan: zan,
      courseId: courseId,
      visible: visible,
    );
  }
}
