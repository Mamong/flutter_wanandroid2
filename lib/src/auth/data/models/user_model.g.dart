// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      admin: json['admin'] as bool,
      chapterTops: (json['chapterTops'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      coinCount: (json['coinCount'] as num).toInt(),
      collectIds: (json['collectIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      email: json['email'] as String,
      icon: json['icon'] as String,
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      type: (json['type'] as num).toInt(),
      token: json['token'] as String,
      username: json['username'] as String,
    );
