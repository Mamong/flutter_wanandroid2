// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
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

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'admin': instance.admin,
      'chapterTops': instance.chapterTops,
      'coinCount': instance.coinCount,
      'collectIds': instance.collectIds,
      'email': instance.email,
      'icon': instance.icon,
      'id': instance.id,
      'nickname': instance.nickname,
      'type': instance.type,
      'token': instance.token,
      'username': instance.username,
    };
