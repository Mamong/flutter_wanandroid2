// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Navi _$NaviFromJson(Map<String, dynamic> json) => Navi(
      cid: json['cid'] as int,
      name: json['name'] as String,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
