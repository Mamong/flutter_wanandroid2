// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      originId: json['originId'] as int?,
      author: json['author'] as String,
      chapterId: json['chapterId'] as int,
      chapterName: json['chapterName'] as String,
      courseId: json['courseId'] as int,
      desc: json['desc'] as String,
      envelopePic: json['envelopePic'] as String,
      id: json['id'] as int,
      link: json['link'] as String,
      niceDate: json['niceDate'] as String,
      origin: json['origin'] as String,
      publishTime: json['publishTime'] as int,
      superChapterName: json['superChapterName'] as String?,
      title: json['title'] as String,
      userId: json['userId'] as int,
      visible: json['visible'] as int,
      zan: json['zan'] as int,
    );

TagModel _$TagModelFromJson(Map<String, dynamic> json) => TagModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
