// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      originId: (json['originId'] as num?)?.toInt(),
      adminAdd: json['adminAdd'] as bool,
      apkLink: json['apkLink'] as String,
      audit: (json['audit'] as num).toInt(),
      author: json['author'] as String,
      canEdit: json['canEdit'] as bool,
      chapterId: (json['chapterId'] as num).toInt(),
      chapterName: json['chapterName'] as String,
      collect: json['collect'] as bool,
      courseId: (json['courseId'] as num).toInt(),
      desc: json['desc'] as String,
      descMd: json['descMd'] as String,
      envelopePic: json['envelopePic'] as String,
      fresh: json['fresh'] as bool,
      host: json['host'] as String,
      id: (json['id'] as num).toInt(),
      isAdminAdd: json['isAdminAdd'] as bool,
      link: json['link'] as String,
      niceDate: json['niceDate'] as String,
      niceShareDate: json['niceShareDate'] as String,
      origin: json['origin'] as String,
      prefix: json['prefix'] as String,
      projectLink: json['projectLink'] as String,
      publishTime: (json['publishTime'] as num).toInt(),
      realSuperChapterId: (json['realSuperChapterId'] as num).toInt(),
      selfVisible: (json['selfVisible'] as num).toInt(),
      shareDate: (json['shareDate'] as num?)?.toInt(),
      shareUser: json['shareUser'] as String,
      superChapterId: (json['superChapterId'] as num).toInt(),
      superChapterName: json['superChapterName'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      type: (json['type'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      visible: (json['visible'] as num).toInt(),
      zan: (json['zan'] as num).toInt(),
    );

TagModel _$TagModelFromJson(Map<String, dynamic> json) => TagModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
