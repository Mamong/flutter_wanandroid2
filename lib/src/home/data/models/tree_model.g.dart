// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeModel _$TreeModelFromJson(Map<String, dynamic> json) => TreeModel(
      author: json['author'] as String,
      children: (json['children'] as List<dynamic>)
          .map((e) => TreeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      courseId: (json['courseId'] as num).toInt(),
      cover: json['cover'] as String,
      desc: json['desc'] as String,
      id: (json['id'] as num).toInt(),
      lisense: json['lisense'] as String,
      lisenseLink: json['lisenseLink'] as String,
      name: json['name'] as String,
      order: (json['order'] as num).toInt(),
      parentChapterId: (json['parentChapterId'] as num).toInt(),
      type: (json['type'] as num).toInt(),
      userControlSetTop: json['userControlSetTop'] as bool,
      visible: (json['visible'] as num).toInt(),
    );
