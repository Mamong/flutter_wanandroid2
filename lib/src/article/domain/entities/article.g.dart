// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      author: json['author'] as String,
      chapterId: json['chapterId'] as int,
      chapterName: json['chapterName'] as String,
      collect: json['collect'] as bool,
      desc: json['desc'] as String,
      envelopePic: json['envelopePic'] as String,
      id: json['id'] as int,
      link: json['link'] as String,
      niceDate: json['niceDate'] as String,
      origin: json['origin'] as String,
      originId: json['originId'] as int?,
      publishTime: json['publishTime'] as int,
      shareUser: json['shareUser'] as String,
      superChapterName: json['superChapterName'] as String,
      title: json['title'] as String,
      type: json['type'] as int,
      userId: json['userId'] as int,
      zan: json['zan'] as int,
      isTop: json['isTop'] as bool? ?? false,
    );

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      name: json['name'] as String,
      url: json['url'] as String,
    );
