// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tree _$TreeFromJson(Map<String, dynamic> json) => Tree(
      author: json['author'] as String,
      children: (json['children'] as List<dynamic>)
          .map((e) => Tree.fromJson(e as Map<String, dynamic>))
          .toList(),
      courseId: json['courseId'] as int,
      cover: json['cover'] as String,
      desc: json['desc'] as String,
      id: json['id'] as int,
      lisense: json['lisense'] as String,
      lisenseLink: json['lisenseLink'] as String,
      name: json['name'] as String,
      parentChapterId: json['parentChapterId'] as int,
      type: json['type'] as int,
      userControlSetTop: json['userControlSetTop'] as bool,
    );
