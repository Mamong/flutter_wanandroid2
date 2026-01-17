// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NaviModel _$NaviModelFromJson(Map<String, dynamic> json) => NaviModel(
      cid: (json['cid'] as num).toInt(),
      name: json['name'] as String,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
