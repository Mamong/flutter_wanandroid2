// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    CollectionModel(
      originId: (json['originId'] as num?)?.toInt(),
      author: json['author'] as String,
      chapterId: (json['chapterId'] as num).toInt(),
      chapterName: json['chapterName'] as String,
      courseId: (json['courseId'] as num).toInt(),
      desc: json['desc'] as String,
      envelopePic: json['envelopePic'] as String,
      id: (json['id'] as num).toInt(),
      link: json['link'] as String,
      niceDate: json['niceDate'] as String,
      origin: json['origin'] as String,
      publishTime: (json['publishTime'] as num).toInt(),
      superChapterName: json['superChapterName'] as String?,
      title: json['title'] as String,
      userId: (json['userId'] as num).toInt(),
      visible: (json['visible'] as num).toInt(),
      zan: (json['zan'] as num).toInt(),
    );
