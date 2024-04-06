// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      admin: json['admin'] as bool,
      chapterTops:
          (json['chapterTops'] as List<dynamic>).map((e) => e as int).toList(),
      coinCount: json['coinCount'] as int,
      collectIds:
          (json['collectIds'] as List<dynamic>).map((e) => e as int).toList(),
      email: json['email'] as String,
      icon: json['icon'] as String,
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      type: json['type'] as int,
      token: json['token'] as String,
      username: json['username'] as String,
    );
